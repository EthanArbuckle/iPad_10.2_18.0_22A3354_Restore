@implementation SGREMaterialCompilationOptions

- (CGColorSpace)workingColorSpace
{
  return (CGColorSpace *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___SGREMaterialCompilationOptions_workingColorSpace));
}

- (SGREMaterialCompilationOptions)initWithWorkingColorSpace:(CGColorSpace *)a3
{
  objc_class *ObjectType;
  CGColorSpace *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterialCompilationOptions_enableFailedCompileMaterial) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterialCompilationOptions_forceEnableTier1FallbackSupport) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterialCompilationOptions_workingColorSpace) = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[SGREMaterialCompilationOptions init](&v8, sel_init);
}

- (SGREMaterialCompilationOptions)init
{
  SGREMaterialCompilationOptions *result;

  result = (SGREMaterialCompilationOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
