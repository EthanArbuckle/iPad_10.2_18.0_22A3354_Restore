@implementation PILongExposureRegistrationRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PILongExposureRegistrationRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 19, self->_recipe);
  size = self->_cleanAperture.size;
  *((_OWORD *)v4 + 10) = self->_cleanAperture.origin;
  *(($5BB7312FFE32F1AB3F1F5957C99A58B3 *)v4 + 11) = size;
  return v4;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([PILongExposureRegistrationJob alloc], "initWithRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- ($B5E4F2499D3E0A90C7E8AF059312C337)cleanAperture
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[5].var1;
  retstr->var0 = self[5].var0;
  retstr->var1 = var1;
  return self;
}

- (void)setCleanAperture:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_cleanAperture.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_cleanAperture.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
