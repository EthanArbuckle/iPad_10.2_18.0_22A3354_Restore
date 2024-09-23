@implementation _ICQTextView

- (_ICQTextView)initWithFrame:(CGRect)a3
{
  _ICQTextView *v3;
  _ICQTextView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)_ICQTextView;
  v3 = -[_ICQTextView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_ICQTextView setSelectable:](v3, "setSelectable:", 1);
    -[_ICQTextView setEditable:](v4, "setEditable:", 0);
    -[_ICQTextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    -[_ICQTextView textDragInteraction](v4, "textDragInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

    -[_ICQTextView setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_ICQTextView gestureRecognizers](v4, "gestureRecognizers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            objc_msgSend(v12, "minimumPressDuration");
            if (v13 >= 0.499999881)
              objc_msgSend(v12, "setEnabled:", 0);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)setAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD1458];
  -[_ICQTextView format](self, "format");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView links](self, "links");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringWithFormat:attributes:links:", v7, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView setAttributedText:](self, "setAttributedText:", v6);

}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_storeStrong((id *)&self->_links, a3);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
