@implementation NIPlatformInfo

+ (BOOL)isInternalBuild
{
  if (qword_100856F20 != -1)
    dispatch_once(&qword_100856F20, &stru_100809878);
  return byte_100856F18;
}

+ (BOOL)supportsUWB
{
  if (qword_100856F30 != -1)
    dispatch_once(&qword_100856F30, &stru_100809898);
  return byte_100856F28;
}

+ (BOOL)supportsAoA
{
  if (qword_100856F40 != -1)
    dispatch_once(&qword_100856F40, &stru_1008098B8);
  return byte_100856F38;
}

+ (BOOL)supportsSyntheticAperture
{
  if (qword_100856F50 != -1)
    dispatch_once(&qword_100856F50, &stru_1008098D8);
  return byte_100856F48;
}

+ (BOOL)supportsARKit
{
  if (qword_100856F60 != -1)
    dispatch_once(&qword_100856F60, &stru_1008098F8);
  return byte_100856F58;
}

+ (BOOL)supportsNBAMMS
{
  if (qword_100856F70 != -1)
    dispatch_once(&qword_100856F70, &stru_100809918);
  return byte_100856F68;
}

@end
