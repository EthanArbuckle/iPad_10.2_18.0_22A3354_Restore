@implementation VFXSceneLoadOptions

- (VFXSceneLoadOptions)init
{
  return (VFXSceneLoadOptions *)VFXScene.LoadOptions.init()();
}

- (BOOL)isAuthoringWorld
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isAuthoringWorld);
}

- (void)setIsAuthoringWorld:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isAuthoringWorld) = a3;
}

- (BOOL)isVFX2
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isVFX2);
}

- (void)setIsVFX2:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isVFX2) = a3;
}

- (BOOL)enableRuntimeScriptCompilation
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableRuntimeScriptCompilation);
}

- (void)setEnableRuntimeScriptCompilation:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableRuntimeScriptCompilation) = a3;
}

- (BOOL)allowLoadingFromFuture
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_allowLoadingFromFuture);
}

- (void)setAllowLoadingFromFuture:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_allowLoadingFromFuture) = a3;
}

- (BOOL)setupAsTemplate
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsTemplate);
}

- (void)setSetupAsTemplate:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsTemplate) = a3;
}

- (BOOL)automaticallyPrepareScene
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_automaticallyPrepareScene);
}

- (void)setAutomaticallyPrepareScene:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_automaticallyPrepareScene) = a3;
}

- (BOOL)setupAsyncRuntime
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsyncRuntime);
}

- (void)setSetupAsyncRuntime:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsyncRuntime) = a3;
}

- (__CFXWorld)world
{
  return (__CFXWorld *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___VFXSceneLoadOptions_world));
}

- (void)setWorld:(__CFXWorld *)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_world) = (Class)a3;
}

- (_opaque_pthread_mutex_t)asyncRuntimeLock
{
  return *(_opaque_pthread_mutex_t **)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_asyncRuntimeLock);
}

- (void)setAsyncRuntimeLock:(_opaque_pthread_mutex_t *)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_asyncRuntimeLock) = (Class)a3;
}

- (BOOL)loadBindingsMetadata
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_loadBindingsMetadata);
}

- (void)setLoadBindingsMetadata:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_loadBindingsMetadata) = a3;
}

- (BOOL)enableParallelDecoding
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableParallelDecoding);
}

- (void)setEnableParallelDecoding:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableParallelDecoding) = a3;
}

- (BOOL)setupRenderer
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupRenderer);
}

- (void)setSetupRenderer:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupRenderer) = a3;
}

- (unint64_t)colorPixelFormat
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_colorPixelFormat);
}

- (void)setColorPixelFormat:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_colorPixelFormat) = (Class)a3;
}

- (unint64_t)depthPixelFormat
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_depthPixelFormat);
}

- (void)setDepthPixelFormat:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_depthPixelFormat) = (Class)a3;
}

- (BOOL)enableDeferredRendering
{
  return (*((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableDeferredRendering) == 2) | *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableDeferredRendering) & 1;
}

- (void)setEnableDeferredRendering:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableDeferredRendering) = a3;
}

- (char)internalPixelFormatDepth
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_internalPixelFormatDepth);
}

- (void)setInternalPixelFormatDepth:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_internalPixelFormatDepth) = a3;
}

- (BOOL)useGammaBlending
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_useGammaBlending);
}

- (void)setUseGammaBlending:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_useGammaBlending) = a3;
}

- (BOOL)doNotClearRenderOutput
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_doNotClearRenderOutput);
}

- (void)setDoNotClearRenderOutput:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_doNotClearRenderOutput) = a3;
}

- (MTLDevice)device
{
  return (MTLDevice *)(id)swift_unknownObjectRetain();
}

- (void)setDevice:(id)a3
{
  sub_1B1C2822C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___VFXSceneLoadOptions_device);
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)(id)swift_unknownObjectRetain();
}

- (void)setCommandQueue:(id)a3
{
  sub_1B1C2822C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___VFXSceneLoadOptions_commandQueue);
}

- (NSString)clientID
{
  void *v2;

  if (*(_QWORD *)&self->isAuthoringWorld[OBJC_IVAR___VFXSceneLoadOptions_clientID])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B2228728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setClientID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_1B222874C();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___VFXSceneLoadOptions_clientID);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (NSURL)metalLibraryURL
{
  return (NSURL *)sub_1B1C2A164((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___VFXSceneLoadOptions_metalLibraryURL);
}

- (void)setMetalLibraryURL:(id)a3
{
  sub_1B1C2A24C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___VFXSceneLoadOptions_metalLibraryURL);
}

- ($0B5AAA5EDDD3F9F6D304638ADE998406)counterStorage
{
  return *($0B5AAA5EDDD3F9F6D304638ADE998406 *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_counterStorage);
}

- (void)setCounterStorage:(id)a3
{
  *($0B5AAA5EDDD3F9F6D304638ADE998406 *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_counterStorage) = a3;
}

- (int)peerPid
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerPid);
}

- (void)setPeerPid:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerPid) = a3;
}

- (unsigned)peerTaskIdentity
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerTaskIdentity);
}

- (void)setPeerTaskIdentity:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerTaskIdentity) = a3;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B19EC9A4((uint64_t)self + OBJC_IVAR___VFXSceneLoadOptions_metalLibraryURL);
}

- (void)registerVFX2AuthoringSystems:(BOOL)a3
{
  uint64_t v3;

  v3 = 2147517449;
  if (a3)
    v3 = 0x1008000840FLL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_systemRegistrationOptions) = (Class)v3;
}

@end
