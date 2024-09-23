@implementation TUIElementAnimationSet

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationValueBuilding;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  uint64_t var0;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  _OWORD v15[3];

  v8 = a3;
  v9 = a5;
  var0 = a4.var0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 137, a4.var0));
  v12 = +[TUIAttributeRegistry lookupAttributeWithName:](TUIAttributeRegistry, "lookupAttributeWithName:", v11);
  if (v12 == 8)
  {
    objc_msgSend(v9, "floatForAttribute:node:", 215, var0);
    v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
LABEL_10:
    v13 = (void *)v14;
    if (v14)
      objc_msgSend(v8, "addAnimationValue:forAttributeName:", v14, v11);
    goto LABEL_12;
  }
  if (v12 == 208)
  {
    if (v9)
      objc_msgSend(v9, "transformForAttribute:node:", 215, var0);
    else
      memset(v15, 0, sizeof(v15));
    v14 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGAffineTransform:](NSValue, "valueWithCGAffineTransform:", v15));
    goto LABEL_10;
  }
  if (v12 != 0xFFFF)
  {
    v13 = 0;
LABEL_12:

  }
}

@end
