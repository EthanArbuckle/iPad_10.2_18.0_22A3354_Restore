@implementation _UIIntelligenceLightSourceDescriptor

+ (id)livingLightWithPalette:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_18566E314((uint64_t)v4);

  return v5;
}

+ (id)livingLightWithPalette:(id)a3 seed:(unsigned int)a4
{
  id v6;
  id v7;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = sub_18566E38C(v6, a4);

  return v7;
}

+ (id)sharedLight
{
  swift_getObjCClassMetadata();
  return static _UIIntelligenceLightSourceDescriptor.sharedLight()();
}

+ (id)sharedReactiveLight
{
  swift_getObjCClassMetadata();
  return static _UIIntelligenceLightSourceDescriptor.sharedReactiveLight()();
}

+ (id)sharedShimmeringLight
{
  swift_getObjCClassMetadata();
  return static _UIIntelligenceLightSourceDescriptor.sharedShimmeringLight()();
}

+ (id)sharedReactiveShimmeringLight
{
  swift_getObjCClassMetadata();
  return static _UIIntelligenceLightSourceDescriptor.sharedReactiveShimmeringLight()();
}

+ (id)directionalLightWithConfiguration:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static _UIIntelligenceLightSourceDescriptor.directionalLight(with:)(v4);

  return v5;
}

- (_UIIntelligenceLightSourceDescriptor)initWithLightSourceViewProvider:(id)a3
{
  id v4;
  _UIIntelligenceLightSourceDescriptor *v5;
  void *v6;
  id builder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIIntelligenceLightSourceDescriptor;
  v5 = -[_UIIntelligenceLightSourceDescriptor init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    builder = v5->_builder;
    v5->_builder = v6;

    v5->_defaultHint = 0;
  }

  return v5;
}

- (id)_createLightSourceViewWithFrame:(CGRect)a3 usage:(unint64_t)defaultHint
{
  id v4;
  _QWORD v6[6];
  CGRect v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!defaultHint)
    defaultHint = self->_defaultHint;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__200;
  v13 = __Block_byref_object_dispose__200;
  v14 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78___UIIntelligenceLightSourceDescriptor__createLightSourceViewWithFrame_usage___block_invoke;
  v6[3] = &unk_1E16E5270;
  v6[4] = self;
  v6[5] = &v9;
  v7 = a3;
  v8 = defaultHint;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (_UIIntelligenceLightSourceDescriptor)descriptorWithDefaultUsageHint:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[_UIIntelligenceLightSourceDescriptor copy](self, "copy");
  v4[2] = a3;
  return (_UIIntelligenceLightSourceDescriptor *)v4;
}

- (_UIIntelligenceLightSourceDescriptor)descriptorWithModifier:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = (_QWORD *)-[_UIIntelligenceLightSourceDescriptor copy](self, "copy");
  v6 = _Block_copy(self->_builder);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63___UIIntelligenceLightSourceDescriptor_descriptorWithModifier___block_invoke;
  v12[3] = &unk_1E16E5298;
  v13 = v6;
  v14 = v4;
  v7 = v4;
  v8 = v6;
  v9 = _Block_copy(v12);
  v10 = (void *)v5[1];
  v5[1] = v9;

  return (_UIIntelligenceLightSourceDescriptor *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[_UIIntelligenceLightSourceDescriptor initWithLightSourceViewProvider:]([_UIIntelligenceLightSourceDescriptor alloc], "initWithLightSourceViewProvider:", self->_builder);
  *((_QWORD *)result + 2) = self->_defaultHint;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_builder, 0);
}

@end
