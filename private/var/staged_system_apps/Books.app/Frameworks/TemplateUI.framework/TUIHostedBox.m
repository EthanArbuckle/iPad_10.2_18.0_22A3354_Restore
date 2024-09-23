@implementation TUIHostedBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIHostedLayout, a2);
}

+ (unint64_t)presentationFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB3A8 != -1)
  {
    dispatch_once(&qword_2CB3A8, &stru_23ED50);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB3A0, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)arrowDirectionFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB3B8 != -1)
  {
    dispatch_once(&qword_2CB3B8, &stru_23ED70);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB3B0, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

- (TUIHostingIdentifier)hostingIdentifier
{
  return self->_hostingIdentifier;
}

- (void)setHostingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TUIHostingProperties)hostingProperties
{
  return self->_hostingProperties;
}

- (void)setHostingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_hostingProperties, a3);
}

- (NSString)anchorRefId
{
  return self->_anchorRefId;
}

- (void)setAnchorRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorRefId, 0);
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end
