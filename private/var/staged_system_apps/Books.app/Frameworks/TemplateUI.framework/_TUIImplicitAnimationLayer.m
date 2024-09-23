@implementation _TUIImplicitAnimationLayer

+ (id)defaultActionForKey:(id)a3
{
  void *v3;

  if (qword_2CB578)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB578, "animationForKeyPath:", a3));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", a3));
  return v3;
}

@end
