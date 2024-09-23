@implementation ATCRTResponseSFWs

- (ATCRTResponseSFWs)initWithByte0:(unsigned __int8)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ATCRTResponseSFWs;
  return -[ATCRTResponse initWithFourCharacterCode:byte0:resultDescriptionFunction:](&v4, sel_initWithFourCharacterCode_byte0_resultDescriptionFunction_, 1397118835, a3, stringForATCRTTaskSFWsResult);
}

@end
