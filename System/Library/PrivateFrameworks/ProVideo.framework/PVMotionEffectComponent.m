@implementation PVMotionEffectComponent

- (PVMotionEffectComponent)initWithMotionEffect:(id)a3
{
  id v4;
  PVMotionEffectComponent *v5;
  PVMotionEffectComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVMotionEffectComponent;
  v5 = -[PVEffectComponent initWithEffect:](&v8, sel_initWithEffect_, v4);
  v6 = v5;
  if (v5)
    -[PVMotionEffectComponent setMotionEffect:](v5, "setMotionEffect:", v4);

  return v6;
}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  PVMotionEffect **p_motionEffect;
  id WeakRetained;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectComponent;
  -[PVEffectComponent effect:updateProperties:allProperties:](&v10, sel_effect_updateProperties_allProperties_, a3, a4, a5);
  p_motionEffect = &self->_motionEffect;
  WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  objc_msgSend(WeakRetained, "assertDocumentIsLocked");

  v8 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v8, "assertDocumentStatusIsLoadedOrReady");

  v9 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v9, "assertInspectablePropertiesAreLocked");

}

- (void)motionEffectDidStartLoading:(id)a3
{
  PVMotionEffect **p_motionEffect;
  id WeakRetained;
  id v5;

  p_motionEffect = &self->_motionEffect;
  WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  objc_msgSend(WeakRetained, "assertDocumentIsLocked");

  v5 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v5, "assertDocumentStatusIsInProgress");

}

- (void)motionEffect:(id)a3 didLoad:(const void *)a4
{
  PVMotionEffect **p_motionEffect;
  id WeakRetained;
  id v6;

  p_motionEffect = &self->_motionEffect;
  WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  objc_msgSend(WeakRetained, "assertDocumentIsLocked");

  v6 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v6, "assertDocumentStatusIsLoaded");

}

- (void)motionEffect:(id)a3 willOpenMedia:(const void *)a4 properties:(id)a5
{
  PVMotionEffect **p_motionEffect;
  id WeakRetained;
  id v7;
  id v8;

  p_motionEffect = &self->_motionEffect;
  WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  objc_msgSend(WeakRetained, "assertDocumentIsLocked");

  v7 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v7, "assertDocumentStatusIsLoaded");

  v8 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v8, "assertInspectablePropertiesAreLocked");

}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  PVMotionEffect **p_motionEffect;
  id WeakRetained;
  id v7;
  id v8;

  p_motionEffect = &self->_motionEffect;
  WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  objc_msgSend(WeakRetained, "assertDocumentIsLocked");

  v7 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v7, "assertDocumentStatusIsReady");

  v8 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v8, "assertInspectablePropertiesAreLocked");

}

- (void)motionEffect:(id)a3 willRender:(const void *)a4 properties:(id)a5 time:(id *)a6
{
  PVMotionEffect **p_motionEffect;
  id WeakRetained;
  id v8;
  id v9;

  p_motionEffect = &self->_motionEffect;
  WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  objc_msgSend(WeakRetained, "assertDocumentIsLocked");

  v8 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v8, "assertDocumentStatusIsReady");

  v9 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v9, "assertInspectablePropertiesAreLocked");

}

- (void)motionEffectDidFailToLoad:(id)a3
{
  PVMotionEffect **p_motionEffect;
  id WeakRetained;
  id v5;

  p_motionEffect = &self->_motionEffect;
  WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  objc_msgSend(WeakRetained, "assertDocumentIsLocked");

  v5 = objc_loadWeakRetained((id *)p_motionEffect);
  objc_msgSend(v5, "assertDocumentStatusIsError");

}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  return 0;
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  return 0;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  return 0;
}

- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  return 0;
}

- (PVMotionEffect)motionEffect
{
  return (PVMotionEffect *)objc_loadWeakRetained((id *)&self->_motionEffect);
}

- (void)setMotionEffect:(id)a3
{
  objc_storeWeak((id *)&self->_motionEffect, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_motionEffect);
}

@end
