@implementation WKUIConfigurationPreviewGenerator

+ (id)uiImageRepresentationForWorkoutFileData:(id)a3
{
  return +[NLWorkoutConfigurationImageGenerator createImageFromData:](NLWorkoutConfigurationImageGenerator, "createImageFromData:", a3);
}

+ (id)uiImageRepresentationForBlastDoorDataSource:(id)a3 scale:(double)a4
{
  return +[NLWorkoutConfigurationImageGenerator createImageFromBlastDoorDataSource:scale:](NLWorkoutConfigurationImageGenerator, "createImageFromBlastDoorDataSource:scale:", a3, a4);
}

@end
