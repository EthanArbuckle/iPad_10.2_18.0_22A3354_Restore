@implementation PIPStates

void __PIPStates_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Showing main video picture in picture");
  v2[1] = CFSTR("Playing background media in picture and picture");
  v2[2] = CFSTR("Showing extras video picture in picture outside extras content");
  v2[3] = CFSTR("Showing extras video picture in picture on extras content");
  v2[4] = CFSTR("Showing multiview playback fullscreen in PIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PIPStates__states;
  PIPStates__states = v0;

}

@end
