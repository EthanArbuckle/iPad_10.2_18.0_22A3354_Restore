@implementation TUIStyledView

+ (id)renderModelWithStyle:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  TUIRenderModelView *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:style:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:style:", CFSTR("TUIReuseIdentifierStyledView"), v5, 0, v6);

  return v7;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  TUIRenderStyling *v6;
  TUIRenderStyling *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIStyledView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v8, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v8.receiver, v8.super_class));

  v6 = (TUIRenderStyling *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "style"));
  v7 = v6;
  if (v6 != self->_currentStyle && (-[TUIRenderStyling isEqualToStyle:](v6, "isEqualToStyle:") & 1) == 0)
  {
    -[TUIRenderStyling removeStylingFromView:](self->_currentStyle, "removeStylingFromView:", self);
    -[TUIRenderStyling applyStylingToView:](v7, "applyStylingToView:", self);
    objc_storeStrong((id *)&self->_currentStyle, v7);
  }
  -[TUIStyledView setAutoresizesSubviews:](self, "setAutoresizesSubviews:", 1);

}

- (void)prepareForReuse
{
  TUIRenderStyling *currentStyle;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIStyledView;
  -[TUIReusableBaseView prepareForReuse](&v4, "prepareForReuse");
  -[TUIRenderStyling removeStylingFromView:](self->_currentStyle, "removeStylingFromView:", self);
  currentStyle = self->_currentStyle;
  self->_currentStyle = 0;

}

- (void)viewDidEndDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIStyledView;
  -[TUIReusableBaseView viewDidEndDisplay](&v3, "viewDidEndDisplay");
  -[TUIStyledView prepareForReuse](self, "prepareForReuse");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStyle, 0);
}

@end
