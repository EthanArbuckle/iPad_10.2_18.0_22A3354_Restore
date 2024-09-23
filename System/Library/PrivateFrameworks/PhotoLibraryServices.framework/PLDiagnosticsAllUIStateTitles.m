@implementation PLDiagnosticsAllUIStateTitles

void ___PLDiagnosticsAllUIStateTitles_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E3760C98;
  v2[1] = &unk_1E3760CB0;
  v3[0] = CFSTR("All");
  v3[1] = CFSTR("Contextual Diagnostics");
  v2[2] = &unk_1E3760CC8;
  v2[3] = &unk_1E3760CE0;
  v3[2] = CFSTR("Current Asset Identifier");
  v3[3] = CFSTR("Current Asset View Model");
  v2[4] = &unk_1E3760CF8;
  v2[5] = &unk_1E3760D10;
  v3[4] = CFSTR("Current Asset Detailed Description");
  v3[5] = CFSTR("Current Asset Metadata");
  v2[6] = &unk_1E3760D28;
  v2[7] = &unk_1E3760D40;
  v3[6] = CFSTR("View Model Description");
  v3[7] = CFSTR("View Controller Hierarchy");
  v2[8] = &unk_1E3760D58;
  v2[9] = &unk_1E3760D70;
  v3[8] = CFSTR("View Controller Descriptions");
  v3[9] = CFSTR("Window Recursive Descriptions");
  v2[10] = &unk_1E3760D88;
  v3[10] = CFSTR("Tungsten Hiearchy");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PLDiagnosticsAllUIStateTitles_allUIStateTitles;
  _PLDiagnosticsAllUIStateTitles_allUIStateTitles = v0;

}

@end
