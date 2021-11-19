
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name sqrt01 -dir "D:/Arshad COM/Term2/low-power/Final/cordic-sqrt/sqrt01/planAhead_run_2" -part xc7k325tfbg676-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/Arshad COM/Term2/low-power/Final/cordic-sqrt/sqrt01/SqrtCORDIC.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Arshad COM/Term2/low-power/Final/cordic-sqrt/sqrt01} }
set_property target_constrs_file "SqrtCORDIC.ucf" [current_fileset -constrset]
add_files [list {SqrtCORDIC.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/Arshad COM/Term2/low-power/Final/cordic-sqrt/sqrt01/SqrtCORDIC.ncd"
if {[catch {read_twx -name results_1 -file "D:/Arshad COM/Term2/low-power/Final/cordic-sqrt/sqrt01/SqrtCORDIC.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/Arshad COM/Term2/low-power/Final/cordic-sqrt/sqrt01/SqrtCORDIC.twx\": $eInfo"
}
