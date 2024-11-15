@implementation SSScreenSnapshot

+ (id)snapshotWithImage:(id)a3 fromScreen:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (UIImage)image
{
  return self->_image;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
