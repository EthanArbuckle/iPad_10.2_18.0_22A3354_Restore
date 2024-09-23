@implementation SUMarkupCell

- (SUMarkupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUMarkupCell *v4;
  SUMarkupCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUMarkupCell;
  v4 = -[SUTableCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[SUTableCellContentView removeFromSuperview](v4->super._configurationView, "removeFromSuperview");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_webView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUMarkupCell;
  -[SUTableCell dealloc](&v3, sel_dealloc);
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUMarkupCell;
  -[SUMarkupCell setBackgroundColor:](&v5, sel_setBackgroundColor_);
  -[SUWebDocumentView setBackgroundColor:](self->_webView, "setBackgroundColor:", a3);
}

- (void)setConfiguration:(id)a3
{
  SUWebDocumentView *v6;
  SUWebDocumentView *webView;
  objc_super v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUMarkupCell.m"), 40, CFSTR("Configuration for markup cell must be markup configuration"));
  v8.receiver = self;
  v8.super_class = (Class)SUMarkupCell;
  -[SUTableCell setConfiguration:](&v8, sel_setConfiguration_, a3);
  v6 = (SUWebDocumentView *)objc_msgSend((id)objc_msgSend(a3, "context"), "webViewForMarkup:", objc_msgSend((id)objc_msgSend(a3, "representedObject"), "humanReadableDescription"));
  webView = self->_webView;
  if (v6 != webView)
  {
    -[SUWebDocumentView removeFromSuperview](webView, "removeFromSuperview");

    self->_webView = v6;
    -[SUWebDocumentView setBackgroundColor:](self->_webView, "setBackgroundColor:", -[SUMarkupCell backgroundColor](self, "backgroundColor"));
    if (self->_webView)
      objc_msgSend((id)-[SUMarkupCell contentView](self, "contentView"), "addSubview:", self->_webView);
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUMarkupCell;
  -[SUTableCell setHighlighted:animated:](&v4, sel_setHighlighted_animated_, 0, 0);
}

@end
