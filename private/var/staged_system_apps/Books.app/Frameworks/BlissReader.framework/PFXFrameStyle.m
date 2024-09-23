@implementation PFXFrameStyle

+ (double)mapContentPaddingFromStyleProperties:(id)a3 contentState:(id)a4
{
  double result;

  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(a3, "valueForProperty:", "padding"), a4);
  return result;
}

+ (double)mapRadiusFromStyleProperties:(id)a3 contentState:(id)a4
{
  double result;

  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(a3, "valueForProperty:", "border-radius"), a4);
  return result;
}

@end
