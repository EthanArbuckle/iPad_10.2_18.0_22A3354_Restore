@implementation _LTTranslationToken(Osprey)

- (id)initWithOspreyToken:()Osprey
{
  id v4;
  id v5;
  void *v6;
  float v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&off_257887CF0;
  v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "token");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

    objc_msgSend(v4, "confidence");
    objc_msgSend(v5, "setConfidence:", v7);
    v8 = v5;
  }

  return v5;
}

@end
