@implementation _UISEFirmwareEdgesFailGestureFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (_UISEFirmwareEdgesFailGestureFeature)initWithSettings:(id)a3
{
  _UISEFirmwareEdgesFailGestureFeature *v4;
  _UISEFirmwareEdgesFailGestureFeature *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISEFirmwareEdgesFailGestureFeature;
  v4 = -[_UISEFirmwareEdgesFailGestureFeature init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_touchedEdges = 0;
    objc_storeStrong((id *)&v4->_settings, a3);
    v5->_hasDoneTest = 0;
  }
  return v5;
}

- (id)debugDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISEFirmwareEdgesFailGestureFeature;
  -[_UISEGestureFeature debugDictionary](&v7, sel_debugDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  _UIRectEdgeDescription(self->_touchedEdges);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("touchedEdges"));

  return v4;
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  unint64_t v4;
  unint64_t v5;

  if (a3->var0 == 1 && !self->_hasDoneTest && a3->var3 == 4)
  {
    v4 = (a3->var1 >> 1) & 1 | (4 * (a3->var1 & 1)) & 0xF7 | (8 * ((a3->var1 >> 2) & 1)) | (a3->var1 >> 2) & 2;
    v5 = -[_UISEGestureFeatureSettings targetEdges](self->_settings, "targetEdges");
    self->_touchedEdges = v4 & v5;
    if ((v4 & v5) == 0)
      -[_UISEGestureFeature _setState:](self, "_setState:", 2);
    self->_hasDoneTest = 1;
  }
}

- (unint64_t)touchedEdges
{
  return self->_touchedEdges;
}

@end
