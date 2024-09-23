@implementation VGBodyPoseFeedbackHelper

+ (id)feedbackToString:(unint64_t)a3
{
  if (a3 > 7)
    return CFSTR("unknown");
  else
    return off_251B23070[a3];
}

@end
