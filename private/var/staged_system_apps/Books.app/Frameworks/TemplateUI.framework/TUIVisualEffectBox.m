@implementation TUIVisualEffectBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIVisualEffectLayout, a2);
}

+ (unint64_t)defaultRole
{
  return 1;
}

+ (unint64_t)blurEffectStyleFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB5F8 != -1)
  {
    dispatch_once(&qword_2CB5F8, &stru_240928);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB5F0, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

- (unint64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(unint64_t)a3
{
  self->_blurStyle = a3;
}

@end
