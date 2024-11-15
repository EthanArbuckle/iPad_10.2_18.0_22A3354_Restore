@implementation CuratedCollectionFooterActionItem

- (CuratedCollectionFooterActionItem)initWithType:(unint64_t)a3 title:(id)a4 glyph:(id)a5
{
  id v8;
  id v9;
  CuratedCollectionFooterActionItem *v10;
  CuratedCollectionFooterActionItem *v11;
  NSString *v12;
  NSString *title;
  NSString *v14;
  NSString *glyph;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CuratedCollectionFooterActionItem;
  v10 = -[CuratedCollectionFooterActionItem init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = (NSString *)objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    glyph = v11->_glyph;
    v11->_glyph = v14;

  }
  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
