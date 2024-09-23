@implementation UGCPhotoFeedHeaderTitleModel

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  v4 = a3;
  v5 = objc_opt_class(UGCPhotoFeedHeaderTitleModel);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderTitleModel titleText](self, "titleText"));
    v9 = v7;
    v10 = v8;
    if (v9 | v10
      && (v11 = objc_msgSend((id)v9, "isEqual:", v10), (id)v10, (id)v9, !v11))
    {
      LOBYTE(v13) = 0;
    }
    else
    {
      v12 = objc_msgSend(v6, "showPunchoutSymbol");
      v13 = v12 ^ -[UGCPhotoFeedHeaderTitleModel showPunchoutSymbol](self, "showPunchoutSymbol") ^ 1;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)showPunchoutSymbol
{
  return self->_showPunchoutSymbol;
}

- (void)setShowPunchoutSymbol:(BOOL)a3
{
  self->_showPunchoutSymbol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
