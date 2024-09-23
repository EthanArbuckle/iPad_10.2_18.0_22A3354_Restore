@implementation VGArchivedSurface

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archivedSurfaceWithSurface:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_getAssociatedObject(v4, a1);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (_QWORD *)objc_opt_new();
      v6[1] = v5;
      objc_setAssociatedObject(v5, a1, v6, (void *)1);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "vg_encodeSurface:forKey:", self->_surfaceToEncode, CFSTR("surface"));
}

- (VGArchivedSurface)initWithCoder:(id)a3
{
  id v4;
  VGArchivedSurface *v5;
  uint64_t v6;
  IOSurface *decodedSurface;
  VGArchivedSurface *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGArchivedSurface;
  v5 = -[VGArchivedSurface init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_vg_decodeSurfaceForKey:", CFSTR("surface"));
    v6 = objc_claimAutoreleasedReturnValue();
    decodedSurface = v5->_decodedSurface;
    v5->_decodedSurface = (IOSurface *)v6;

    v8 = v5;
  }

  return v5;
}

- (IOSurface)decodedSurface
{
  return self->_decodedSurface;
}

- (void)setDecodedSurface:(id)a3
{
  objc_storeStrong((id *)&self->_decodedSurface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedSurface, 0);
}

@end
