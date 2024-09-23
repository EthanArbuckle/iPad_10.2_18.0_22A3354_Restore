@implementation ShorteningLabel

- (void)setFont:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ShorteningLabel font](self, "font"));

  v6.receiver = self;
  v6.super_class = (Class)ShorteningLabel;
  -[ShorteningLabel setFont:](&v6, "setFont:", v4);

  if (v5 != v4)
    -[ShorteningLabel _updateAttributedText](self, "_updateAttributedText");
}

- (void)setAttributedTextAlternatives:(id)a3
{
  NSArray *v5;
  NSArray *attributedTextAlternatives;
  unsigned __int8 v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  attributedTextAlternatives = self->_attributedTextAlternatives;
  if (attributedTextAlternatives != v5)
  {
    v8 = v5;
    v7 = -[NSArray isEqualToArray:](attributedTextAlternatives, "isEqualToArray:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_attributedTextAlternatives, a3);
      -[ShorteningLabel _updateAttributedText](self, "_updateAttributedText");
      v5 = v8;
    }
  }

}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ShorteningLabel;
  -[ShorteningLabel layoutSubviews](&v4, "layoutSubviews");
  -[ShorteningLabel bounds](self, "bounds");
  if (v3 != self->_lastUpdateWidth)
    -[ShorteningLabel _updateAttributedText](self, "_updateAttributedText");
}

- (void)_updateAttributedText
{
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  NSAttributedStringKey v24;
  void *v25;
  _BYTE v26[128];

  -[ShorteningLabel bounds](self, "bounds");
  if (v3 > 0.0)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShorteningLabel attributedTextAlternatives](self, "attributedTextAlternatives"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShorteningLabel attributedTextAlternatives](self, "attributedTextAlternatives"));
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShorteningLabel attributedTextAlternatives](self, "attributedTextAlternatives"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShorteningLabel attributedTextAlternatives](self, "attributedTextAlternatives"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v12)
        {
          v13 = v12;
          v19 = v10;
          v14 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v10 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i));
              v24 = NSFontAttributeName;
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[ShorteningLabel font](self, "font"));
              v25 = v16;
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
              objc_msgSend(v10, "setAttributes:range:", v17, 0, objc_msgSend(v10, "length"));

              objc_msgSend(v10, "size");
              if (v18 <= v4)
              {

                goto LABEL_14;
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
            if (v13)
              continue;
            break;
          }
          v10 = v19;
        }
LABEL_14:

        -[ShorteningLabel setAttributedText:](self, "setAttributedText:", v10);
      }
      else
      {
        -[ShorteningLabel setAttributedText:](self, "setAttributedText:", 0);
      }
      self->_lastUpdateWidth = v4;
    }
  }
}

- (NSArray)attributedTextAlternatives
{
  return self->_attributedTextAlternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedTextAlternatives, 0);
}

@end
