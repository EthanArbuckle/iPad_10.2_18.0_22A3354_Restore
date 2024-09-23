@implementation PVFaceCropSourceDescriptor

- (PVFaceCropSourceDescriptor)initWithFace:(id)a3 image:(id)a4
{
  id v7;
  id v8;
  PVFaceCropSourceDescriptor *v9;
  PVFaceCropSourceDescriptor *v10;
  PVFaceCropSourceDescriptor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVFaceCropSourceDescriptor;
  v9 = -[PVFaceCropSourceDescriptor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_face, a3);
    objc_storeStrong((id *)&v10->_image, a4);
    v11 = v10;
  }

  return v10;
}

- (id)face
{
  return self->_face;
}

- (id)image
{
  return self->_image;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PVFaceCropSourceDescriptor;
  -[PVFaceCropSourceDescriptor description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (face=%@ image=%@)"), v4, self->_face, self->_image);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

+ (id)descriptorForFace:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFace:image:", v7, v6);

  return v8;
}

@end
