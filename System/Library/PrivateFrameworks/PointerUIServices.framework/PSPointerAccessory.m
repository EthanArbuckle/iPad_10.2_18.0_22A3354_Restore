@implementation PSPointerAccessory

- (unint64_t)hash
{
  return -[PSPointerShape hash](self->_shape, "hash") ^ (unint64_t)self->_offset ^ (unint64_t)self->_angle ^ self->_orientationMatchesAngle;
}

- (BOOL)isEqual:(id)a3
{
  PSPointerAccessory *v4;
  BOOL v5;

  v4 = (PSPointerAccessory *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && BSEqualObjects()
      && BSFloatEqualToFloat()
      && BSFloatEqualToFloat()
      && v4->_orientationMatchesAngle == self->_orientationMatchesAngle;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  PSPointerAccessory *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __33__PSPointerAccessory_description__block_invoke;
  v11 = &unk_1E287B708;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("PSPointerAccessory"), v4, &v8);

  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __33__PSPointerAccessory_description__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("_shape"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("_offset"), *(double *)(*(_QWORD *)(a1 + 40) + 24));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("_angle"), *(double *)(*(_QWORD *)(a1 + 40) + 32));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("_orientationMatchesAngle"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_shape);
  *(double *)(v4 + 24) = self->_offset;
  *(double *)(v4 + 32) = self->_angle;
  *(_BYTE *)(v4 + 8) = self->_orientationMatchesAngle;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSPointerAccessory)initWithCoder:(id)a3
{
  id v4;
  PSPointerAccessory *v5;
  uint64_t v6;
  PSPointerShape *shape;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSPointerAccessory;
  v5 = -[PSPointerAccessory init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shape"));
    v6 = objc_claimAutoreleasedReturnValue();
    shape = v5->_shape;
    v5->_shape = (PSPointerShape *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("offset"));
    v5->_offset = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("angle"));
    v5->_angle = v9;
    v5->_orientationMatchesAngle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("orientationMatchesAngle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PSPointerShape *shape;
  id v5;

  shape = self->_shape;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", shape, CFSTR("shape"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("offset"), self->_offset);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("angle"), self->_angle);
  objc_msgSend(v5, "encodeBool:forKey:", self->_orientationMatchesAngle, CFSTR("orientationMatchesAngle"));

}

- (PSPointerShape)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (BOOL)orientationMatchesAngle
{
  return self->_orientationMatchesAngle;
}

- (void)setOrientationMatchesAngle:(BOOL)a3
{
  self->_orientationMatchesAngle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
