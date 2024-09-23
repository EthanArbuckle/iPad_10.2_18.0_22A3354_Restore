@implementation _UIDictationMicOnButton

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDictationMicOnButton;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[_UIDictationMicOnButton setupShapeLayer](self, "setupShapeLayer");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIDictationMicOnButton;
  -[UIButton layoutSubviews](&v11, sel_layoutSubviews);
  -[UIButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", *MEMORY[0x1E0CD2F28]);

  -[UIButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "position");
  v7 = v6;
  v9 = v8;
  -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPosition:", v7, v9);

}

- (void)setupShapeLayer
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIButton imageView](self, "imageView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "position");
    v5 = v4;
    v7 = v6;
    -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPosition:", v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDictationMicOnButton setShapeLayer:](self, "setShapeLayer:", v9);

    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E0C9D538], v11, 30.0, 30.0, 6.0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGPath");
    -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPath:", v13);

    -[UIView tintColor](self, "tintColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "CGColor");
    -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFillColor:", v16);

    -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBounds:", v10, v11, 30.0, 30.0);

    -[UIButton imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "position");
    v21 = v20;
    v23 = v22;
    -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPosition:", v21, v23);

    -[UIView layer](self, "layer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDictationMicOnButton shapeLayer](self, "shapeLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton imageView](self, "imageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertSublayer:below:", v8, v26);

  }
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end
