@implementation TUIGuides

- (TUIGuides)initWithLeading:(id)a3 trailing:(id)a4 top:(id)a5 bottom:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUIGuides *v15;
  TUIGuides *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUIGuides;
  v15 = -[TUIGuides init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_leading, a3);
    objc_storeStrong((id *)&v16->_trailing, a4);
    objc_storeStrong((id *)&v16->_top, a5);
    objc_storeStrong((id *)&v16->_bottom, a6);
  }

  return v16;
}

- (TUIGuideSpec)leading
{
  return self->_leading;
}

- (TUIGuideSpec)trailing
{
  return self->_trailing;
}

- (TUIGuideSpec)top
{
  return self->_top;
}

- (TUIGuideSpec)bottom
{
  return self->_bottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_top, 0);
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_leading, 0);
}

@end
