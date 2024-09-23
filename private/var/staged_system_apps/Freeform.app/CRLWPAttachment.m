@implementation CRLWPAttachment

+ (unint64_t)attributeArrayKind
{
  return 4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  id v8;
  objc_super v9;

  *(_QWORD *)&v5 = objc_opt_class(CRLWPAttachment, a2).n128_u64[0];
  if (v6 == a1)
  {
    v8 = objc_autorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("It is illegal to instantiate CRLWPAttachment; it is abstract"),
                                  0,
                                  v5)));
    objc_exception_throw(v8);
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CRLWPAttachment;
  return objc_msgSendSuper2(&v9, "allocWithZone:", a3, v5);
}

+ (id)mostSpecificAttachmentFromInfo:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (!a3)
    return 0;
  v4 = objc_opt_class(a3, a2);
  return v4 == objc_opt_class(self, v5);
}

- (unint64_t)hash
{
  return 0;
}

- (unsigned)elementKind
{
  return 0;
}

- (BOOL)changesWithPageCount
{
  return 0;
}

- (id)topLevelAttachment
{
  return self;
}

- (BOOL)isDrawable
{
  return 0;
}

- (BOOL)isAnchored
{
  return 0;
}

- (BOOL)isPartitioned
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPAttachment parentStorage](self, "parentStorage"));
  v3 = objc_msgSend(v2, "wpKind") == 0;

  return v3;
}

- (BOOL)isSearchable
{
  return 0;
}

- (BOOL)isHorizontallyCentered
{
  return 0;
}

- (BOOL)isVerticallyCentered
{
  return 0;
}

- (BOOL)specifiesEnabledKnobMask
{
  return 0;
}

- (unint64_t)enabledKnobMaskWithRep:(id)a3
{
  return 0;
}

- (BOOL)shouldInvalidateWhenTextPropertiesChange
{
  return 0;
}

- (BOOL)preserveAttributesOverSelectionWhenInserting
{
  return 0;
}

- (CRLWPTextSource)parentStorage
{
  return (CRLWPTextSource *)objc_loadWeakRetained((id *)&self->_parentStorage);
}

- (void)setParentStorage:(id)a3
{
  objc_storeWeak((id *)&self->_parentStorage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentStorage);
}

@end
