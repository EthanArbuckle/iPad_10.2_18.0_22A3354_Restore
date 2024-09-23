@implementation GEOCompanionStep

- (id)representativeSignGuidanceEvent
{
  id AssociatedObject;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCompanionStep guidanceEvents](self, "guidanceEvents"));
    v7 = sub_1007EAE9C(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (!v5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_setAssociatedObject(self, a2, v5, (void *)1);
      v10 = 0;
      goto LABEL_8;
    }
    objc_setAssociatedObject(self, a2, v5, (void *)1);
  }
  v8 = objc_opt_class(GEOGuidanceEvent);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    v9 = v5;
  else
    v9 = 0;
  v10 = v9;
LABEL_8:

  return v10;
}

@end
