@implementation PVCameraPreviewRenderer

- (PVCameraPreviewRenderer)init
{
  PVCameraPreviewRenderer *v2;
  PVCameraPreviewRenderer *v3;
  PVRenderManager *m_Obj;
  PVRenderManager *v5;
  uint64_t v6;
  PVVideoCompositingContext *compositingContext;
  PVRenderManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PVCameraPreviewRenderer;
  v2 = -[PVCameraPreviewRenderer init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    PVRenderManager::INSTANCE((PVRenderManager *)v2, &v9);
    m_Obj = v3->_renderManager.m_Obj;
    v5 = v9;
    if (m_Obj == v9)
    {
      if (m_Obj)
      {
        (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(v3->_renderManager.m_Obj);
        v5 = v3->_renderManager.m_Obj;
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(v3->_renderManager.m_Obj);
        v5 = v9;
      }
      v3->_renderManager.m_Obj = v5;
    }
    PVRenderManager::SetupTextureFactories(v5, 0.5);
    +[PVVideoCompositingContext createContextForGPU](PVVideoCompositingContext, "createContextForGPU");
    v6 = objc_claimAutoreleasedReturnValue();
    compositingContext = v3->_compositingContext;
    v3->_compositingContext = (PVVideoCompositingContext *)v6;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  PVRenderManager::TearDownTextureFactories(self->_renderManager.m_Obj);
  v3.receiver = self;
  v3.super_class = (Class)PVCameraPreviewRenderer;
  -[PVCameraPreviewRenderer dealloc](&v3, sel_dealloc);
}

- (HGRef<PVRenderManager>)renderManager
{
  PVRenderManager **v2;
  PVRenderManager *m_Obj;

  m_Obj = self->_renderManager.m_Obj;
  *v2 = m_Obj;
  if (m_Obj)
    return (HGRef<PVRenderManager>)(*(uint64_t (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 16))(m_Obj);
  return (HGRef<PVRenderManager>)m_Obj;
}

- (HGRef<HGGLContext>)rootContext
{
  _QWORD *v2;

  return (HGRef<HGGLContext>)PVRenderManager::GetRootContext(self->_renderManager.m_Obj, v2);
}

- (void)enqueueRenderRequest:(id)a3 completion:(id)a4
{
  id v6;
  HGRef<HGRenderJob> *p_currentRenderJob;
  HGRenderJob *v8;
  PVRenderManager *m_Obj;
  HGRenderJob *v10;
  id v11;
  PVRenderManager *v12;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    p_currentRenderJob = &self->_currentRenderJob;
    if (self->_currentRenderJob.m_Obj)
      PVRenderManager::CancelRenderJob((uint64_t)self->_renderManager.m_Obj, &self->_currentRenderJob.m_Obj);
    v8 = (HGRenderJob *)HGObject::operator new(0x180uLL);
    m_Obj = self->_renderManager.m_Obj;
    v12 = m_Obj;
    if (m_Obj)
      (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 16))(m_Obj);
    PVCameraPreviewGraphBuildJob::PVCameraPreviewGraphBuildJob((uint64_t)v8, (uint64_t *)&v12, v11, self->_compositingContext, v6);
    if (m_Obj)
      (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
    v10 = p_currentRenderJob->m_Obj;
    if (p_currentRenderJob->m_Obj == v8)
    {
      if (v8)
      {
        (*(void (**)(HGRenderJob *))(*(_QWORD *)v8 + 24))(v8);
        v8 = p_currentRenderJob->m_Obj;
      }
    }
    else
    {
      if (v10)
        (*(void (**)(HGRenderJob *))(*(_QWORD *)v10 + 24))(v10);
      p_currentRenderJob->m_Obj = v8;
    }
    HGRenderJob::SetNotifyFunc(v8, (void (*)(HGRenderJob *))PVCameraPreviewGraphBuildJob::Notify);
    HGRenderJob::SetUserName(p_currentRenderJob->m_Obj, "PVCameraPreview Graph Build Job");
    HGUserJob::SetPriority((uint64_t)p_currentRenderJob->m_Obj, 7);
    HGUserJob::SetState((uint64_t)p_currentRenderJob->m_Obj, 2);
    PVRenderManager::EnqueueRenderJob((uint64_t)self->_renderManager.m_Obj, &self->_currentRenderJob.m_Obj);
  }

}

- (void).cxx_destruct
{
  HGRenderJob *m_Obj;
  PVRenderManager *v4;

  objc_storeStrong((id *)&self->_compositingContext, 0);
  m_Obj = self->_currentRenderJob.m_Obj;
  if (m_Obj)
    (*(void (**)(HGRenderJob *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  v4 = self->_renderManager.m_Obj;
  if (v4)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v4 + 24))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
