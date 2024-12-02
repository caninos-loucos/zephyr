-setq=CPP_MANUAL,"https://gcc.gnu.org/onlinedocs/gcc-10.3.0/cpp.pdf"

-doc="Selection for reports that are fully contained in adopted code."
-report_selector+={adopted_report,"all_area(!kind(culprit||evidence)||all_loc(all_exp(adopted||pseudo)))"}

-doc_begin="Adopted code is not meant to be read, reviewed or modified by human programmers:no developers' confusion is not possible. In addition, adopted code is assumed to work as is. Reports that are fully contained in adopted code are hidden/tagged with the 'adopted' tag."
-config=MC3R1.R7.2,reports+={relied,adopted_report}
-config=MC3R1.R10.3,reports+={relied,adopted_report}
-config=MC3R1.R10.6,reports+={relied,adopted_report}
-config=MC3R1.R12.1,reports+={relied,adopted_report}
-doc_end

-doc_begin="Macro LOAPIC_BASE_ADDRESS, automatically generated by Autoconf, expands to an implicitly unsigned literal lacking the 'u' or 'U' suffix."
-config=MC3R1.R7.2,reports+={safe,"all_area(all_loc(any_exp(macro(^assert$))))"}
-doc_end

-doc="#include_next is a documented GNU preprocessing directive. See section \"2.7 Wrapper Headers\" of "CPP_MANUAL""
-config=STD.prepdirc,directives+={safe,"^include_next$"}
-doc="#warning is a documented GNU preprocessing directive. See section \"5 Diagnostics\" of "CPP_MANUAL""
-config=STD.prepdirc,directives+={safe,"^warning$"}

-doc="The declarations in files tagged with api:public define a public API of Zephyr.
Declarations in these files not necessarily have to be referenced."
-config=MC3R1.R2.3,declarations+={safe,"loc(top(public()))"}

-doc="Library entry points not necessarily have to be referenced."
-config=MC3R1.R2.1,declarations+={safe,"loc(top(public()))"}

-doc="Library entry points not necessarily have to be referenced in more than one translation units."
-config=MC3R1.R8.7,declarations+={safe,"loc(top(public()))"}

-doc="Syscall declarations are automatically generated all with the extern qualifier. For the ones with internal linkage the use of the extern qualifier is a violation of rule 8.8."
-config=MC3R1.R8.8,declarations={relied, "^z_vrfy_.*$||^z_impl_.*$"}

-doc="Function hash, that is automatically generated, does not use the parameter \"len\" in all its definitions."
-config=MC3R1.R2.7,declarations+={relied,"context(^hash\\(const char\\*, size_t\\)$)&&name(len)"}

-doc="Function \"z_object_lookup\", that is automatically generated, uses single-statement bodies not enclosed in braces."
-config=MC3R1.R15.6,reports={relied, "all_area(context(^z_object_lookup\\(const char\\*, size_t\\)$))"}

-doc="The following declarations are in generated files: not in all configuration they are implemented.
    Chainging the generators could be dangerous and the advantages in enforcing the rule do not outweight these dangers."
-config=MC3R1.R8.6,declarations+={safe, "loc(top(file(^zephyr/build/zephyr/include/generated/.*$)))"}
