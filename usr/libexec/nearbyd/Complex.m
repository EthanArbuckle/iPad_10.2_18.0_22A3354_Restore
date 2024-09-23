@implementation Complex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Complex)initWithRealPart:(id)a3 imagPart:(id)a4
{
  id v7;
  id v8;
  Complex *v9;
  Complex *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)Complex;
  v9 = -[Complex init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_real, a3);
    objc_storeStrong((id *)&v10->_imag, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Complex real](self, "real"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Complex imag](self, "imag"));
  v7 = objc_msgSend(v4, "initWithRealPart:imagPart:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_real, CFSTR("realValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imag, CFSTR("imagValue"));

}

- (Complex)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  Complex *v11;
  Complex *v12;
  objc_super v14;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("realValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v8), CFSTR("imagValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14.receiver = self;
  v14.super_class = (Class)Complex;
  v11 = -[Complex init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[Complex setReal:](v11, "setReal:", v7);
    -[Complex setImag:](v12, "setImag:", v10);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSNumber *real;
  void *v10;
  NSNumber *v11;
  BOOL v12;
  NSNumber *imag;
  void *v14;
  NSNumber *v15;
  BOOL v16;
  BOOL v17;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v17 = 0;
    goto LABEL_12;
  }
  v7 = v4;
  v8 = v7;
  real = self->_real;
  if (real)
    goto LABEL_5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "real"));

  if (v10)
  {
    real = self->_real;
LABEL_5:
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "real"));
    v12 = real == v11;

    goto LABEL_6;
  }
  v12 = 1;
LABEL_6:
  imag = self->_imag;
  if (!imag)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imag"));

    if (!v14)
    {
      v16 = 1;
      goto LABEL_10;
    }
    imag = self->_imag;
  }
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imag"));
  v16 = imag == v15;

LABEL_10:
  v17 = v12 && v16;

LABEL_12:
  return v17;
}

- (id)description
{
  double v3;
  uint64_t v4;
  double v5;

  -[NSNumber doubleValue](self->_real, "doubleValue");
  v4 = (int)v3;
  -[NSNumber doubleValue](self->_imag, "doubleValue");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RealVal=%d, ImagVal=%d"), v4, (int)v5);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSNumber hash](self->_real, "hash");
  return (unint64_t)-[NSNumber hash](self->_imag, "hash") ^ v3;
}

- (NSNumber)real
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)imag
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imag, 0);
  objc_storeStrong((id *)&self->_real, 0);
}

@end
