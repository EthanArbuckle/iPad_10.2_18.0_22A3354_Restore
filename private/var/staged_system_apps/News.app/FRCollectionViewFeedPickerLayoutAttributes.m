@implementation FRCollectionViewFeedPickerLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)FRCollectionViewFeedPickerLayoutAttributes;
  if (-[FRCollectionViewFeedPickerLayoutAttributes isEqual:](&v47, "isEqual:", v4)
    && (v6 = objc_opt_class(FRCollectionViewFeedPickerLayoutAttributes, v5),
        (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderChannelFont"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderChannelFont](self, "placeholderChannelFont"));
    LODWORD(v10) = +[NSObject nf_object:isEqualToObject:](NSObject, "nf_object:isEqualToObject:", v8, v9);

    if ((_DWORD)v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderTopicFont"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderTopicFont](self, "placeholderTopicFont"));
      LODWORD(v10) = +[NSObject nf_object:isEqualToObject:](NSObject, "nf_object:isEqualToObject:", v11, v12);

      if ((_DWORD)v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderChannelAttributes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderChannelAttributes](self, "placeholderChannelAttributes"));
        LODWORD(v10) = +[NSObject nf_object:isEqualToObject:](NSObject, "nf_object:isEqualToObject:", v13, v14);

        if ((_DWORD)v10)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderTopicAttributes"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderTopicAttributes](self, "placeholderTopicAttributes"));
          LODWORD(v10) = +[NSObject nf_object:isEqualToObject:](NSObject, "nf_object:isEqualToObject:", v15, v16);

          if ((_DWORD)v10)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderTopicImage"));
            objc_msgSend(v10, "size");
            v18 = v17;
            v20 = v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderTopicImage](self, "placeholderTopicImage"));
            objc_msgSend(v21, "size");
            v23 = v22;
            v25 = v24;

            LOBYTE(v10) = 0;
            if (v18 == v23 && v20 == v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderTopicImage"));
              objc_msgSend(v26, "scale");
              v28 = v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderTopicImage](self, "placeholderTopicImage"));
              objc_msgSend(v29, "scale");
              v31 = vabdd_f64(v28, v30);

              if (v31 >= 0.00999999978)
              {
                LOBYTE(v10) = 0;
              }
              else
              {
                v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderChannelImage"));
                objc_msgSend(v10, "size");
                v33 = v32;
                v35 = v34;
                v36 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderChannelImage](self, "placeholderChannelImage"));
                objc_msgSend(v36, "size");
                v38 = v37;
                v40 = v39;

                LOBYTE(v10) = 0;
                if (v33 == v38 && v35 == v40)
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderChannelImage"));
                  objc_msgSend(v41, "scale");
                  v43 = v42;
                  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderChannelImage](self, "placeholderChannelImage"));
                  objc_msgSend(v44, "scale");
                  LOBYTE(v10) = vabdd_f64(v43, v45) < 0.00999999978;

                }
              }
            }
          }
        }
      }
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FRCollectionViewFeedPickerLayoutAttributes;
  v5 = -[FRCollectionViewFeedPickerLayoutAttributes copyWithZone:](&v17, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderChannelFont](self, "placeholderChannelFont"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlaceholderChannelFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderTopicFont](self, "placeholderTopicFont"));
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlaceholderTopicFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderChannelAttributes](self, "placeholderChannelAttributes"));
  v11 = objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlaceholderChannelAttributes:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderTopicAttributes](self, "placeholderTopicAttributes"));
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlaceholderTopicAttributes:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderTopicImage](self, "placeholderTopicImage"));
  objc_msgSend(v5, "setPlaceholderTopicImage:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayoutAttributes placeholderChannelImage](self, "placeholderChannelImage"));
  objc_msgSend(v5, "setPlaceholderChannelImage:", v15);

  return v5;
}

- (UIFont)placeholderTopicFont
{
  return self->_placeholderTopicFont;
}

- (void)setPlaceholderTopicFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicFont, a3);
}

- (UIFont)placeholderChannelFont
{
  return self->_placeholderChannelFont;
}

- (void)setPlaceholderChannelFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelFont, a3);
}

- (NSDictionary)placeholderTopicAttributes
{
  return self->_placeholderTopicAttributes;
}

- (void)setPlaceholderTopicAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicAttributes, a3);
}

- (NSDictionary)placeholderChannelAttributes
{
  return self->_placeholderChannelAttributes;
}

- (void)setPlaceholderChannelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelAttributes, a3);
}

- (UIImage)placeholderTopicImage
{
  return self->_placeholderTopicImage;
}

- (void)setPlaceholderTopicImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicImage, a3);
}

- (UIImage)placeholderChannelImage
{
  return self->_placeholderChannelImage;
}

- (void)setPlaceholderChannelImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderChannelImage, 0);
  objc_storeStrong((id *)&self->_placeholderTopicImage, 0);
  objc_storeStrong((id *)&self->_placeholderChannelAttributes, 0);
  objc_storeStrong((id *)&self->_placeholderTopicAttributes, 0);
  objc_storeStrong((id *)&self->_placeholderChannelFont, 0);
  objc_storeStrong((id *)&self->_placeholderTopicFont, 0);
}

@end
