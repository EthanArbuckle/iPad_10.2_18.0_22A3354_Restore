@implementation _VFXNullMaterial

+ (id)nullMaterial
{
  if (qword_1EEF65F08 != -1)
    dispatch_once(&qword_1EEF65F08, &unk_1E63D7DD8);
  return (id)qword_1EEF65F00;
}

- (_VFXNullMaterial)initWithCoder:(id)a3
{
  _VFXNullMaterial *result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_VFXNullMaterial;
  result = -[VFXMaterial initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (result)
  {

    return (_VFXNullMaterial *)objc_msgSend_nullMaterial(_VFXNullMaterial, v4, v5, v6);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
