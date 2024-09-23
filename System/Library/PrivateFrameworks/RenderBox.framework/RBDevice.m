@implementation RBDevice

+ (BOOL)isSupported
{
  return objc_msgSend(a1, "sharedDefaultDevice") != 0;
}

+ (RBDevice)sharedDefaultDevice
{
  unsigned __int8 v2;
  id v5;

  {
    v5 = a1;
    +[RBDevice sharedDefaultDevice]::device = +[RBDevice sharedDefaultDevice]::$_3::operator()(&v5);
  }
  return (RBDevice *)+[RBDevice sharedDefaultDevice]::device;
}

+ (BOOL)isRunningInBackground
{
  if (background_once != -1)
    dispatch_once_f(&background_once, a1, (dispatch_function_t)init_background_notifications);
  return is_running_in_background && allows_rendering_in_background == 0;
}

+ (uint64_t)sharedDefaultDevice
{
  id v2;
  uint64_t v3;

  v2 = MTLCreateSystemDefaultDevice();
  if (v2)
    v3 = objc_msgSend(*a1, "sharedDevice:", v2);
  else
    v3 = 0;

  return v3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  return self;
}

+ (id)sharedDevice:(id)a3
{
  RB::UntypedTable *v5;
  RB::UntypedTable *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  os_unfair_lock_t lock;
  char v12;
  void *v13;

  lock = (os_unfair_lock_t)&devices_lock;
  v12 = 1;
  os_unfair_lock_lock((os_unfair_lock_t)&devices_lock);
  v5 = (RB::UntypedTable *)device_table;
  if (!device_table)
  {
    v6 = (RB::UntypedTable *)operator new();
    RB::UntypedTable::UntypedTable(v6, 0, 0, (void (*)(void *))+[RBDevice sharedDevice:]::$_0::__invoke, (void (*)(void *))+[RBDevice sharedDevice:]::$_1::__invoke, 0);
    device_table = (uint64_t)v6;
    +[RBDevice isRunningInBackground](RBDevice, "isRunningInBackground");
    v5 = (RB::UntypedTable *)device_table;
  }
  v13 = 0;
  v7 = RB::UntypedTable::lookup(v5, (uint64_t *)a3, &v13);
  if (!v13)
  {
    std::unique_lock<RB::spin_lock>::unlock((uint64_t)&lock);
    v7 = (uint64_t *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", a3);
    std::unique_lock<RB::spin_lock>::lock((uint64_t)&lock);
    v13 = 0;
    v8 = RB::UntypedTable::lookup((RB::UntypedTable *)device_table, (uint64_t *)a3, &v13);
    if (v13)
    {
      v9 = v8;

      v7 = v9;
    }
    else
    {
      RB::UntypedTable::insert((size_t **)device_table, (size_t *)a3, (size_t *)v7);

      all_devices = 0;
    }
  }
  if (v12)
    os_unfair_lock_unlock(lock);
  return v7;
}

- (RBDevice)initWithDevice:(id)a3
{
  RBDevice *v4;
  uint64_t v5;
  Device *p;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RBDevice;
  v4 = -[RBDevice init](&v11, sel_init);
  if (v4)
  {
    v5 = operator new();
    RB::Device::Device(v5, v4, a3);
    p = v4->_device._p;
    v4->_device._p = (Device *)v5;
    if (p)
    {
      v7 = (unsigned int *)((char *)p + 8);
      do
      {
        v8 = __ldxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
      {
        __dmb(9u);
        (*(void (**)(Device *))(*(_QWORD *)p + 8))(p);
      }
    }
  }
  return v4;
}

- (void)collectResources
{
  atomic<unsigned int> *p_pending_collect;
  dispatch_time_t v5;

  p_pending_collect = &self->_pending_collect;
  while (!__ldaxr(&p_pending_collect->__a_.__a_value))
  {
    if (!__stlxr(1u, &p_pending_collect->__a_.__a_value))
    {
      v5 = dispatch_time(0, 1000000000);
      dispatch_after_f(v5, (dispatch_queue_t)-[RBDevice queue](self, "queue"), self, (dispatch_function_t)collect_resources);
      return;
    }
  }
  __clrex();
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)*((_QWORD *)self->_device._p + 4);
}

- (BOOL)compileShader:(id)a3 error:(id *)a4
{
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = rb_shader_type(objc_msgSend(a3, "type"));
  if ((v7 & 0xFF00000000) != 0)
  {
    v8 = v7;
    v9 = -[RBDecodedFontMetadata fontUID]((uint64_t)self);
    if (a3)
      v10 = (uint64_t *)((char *)a3 + 16);
    else
      v10 = 0;
    return RB::FunctionLibrary::compile_shader(v9, v10, v8, a4);
  }
  else
  {
    if (a4)
    {
      v12 = *MEMORY[0x24BDD0FC8];
      v13[0] = CFSTR("Missing shader type.");
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.RenderBox.RBShaderError"), 5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    }
    return 0;
  }
}

- (void)compileShader:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  unsigned __int8 v9;
  RBDevice *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  if ((v9 & 1) == 0
  {
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    -[RBDevice(RBShader) compileShader:completionQueue:handler:]::compilation_queue = (uint64_t)dispatch_queue_create("com.apple.RenderBox.shader-compilation", v15);
  }
  v10 = self;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_msgSend(a5, "copy");
  v14 = -[RBDevice(RBShader) compileShader:completionQueue:handler:]::compilation_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3321888768;
  v16[2] = __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke;
  v16[3] = &__block_descriptor_64_e8_32c30_ZTSN2RB8objc_ptrIP8RBDeviceEE40c30_ZTSN2RB8objc_ptrIP8RBShaderEE48c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7NSErrorEEE56c61_ZTSN2RB8objc_ptrIPU28objcproto17OS_dispatch_queue8NSObjectEE_e5_v8__0l;
  v17 = v10;
  v18 = v11;
  v19 = v13;
  v20 = v12;
  dispatch_async(v14, v16);

}

void __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "compileShader:error:", *(_QWORD *)(a1 + 40), &v7);
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    if (*(_QWORD *)(a1 + 56))
      v3 = *(NSObject **)(a1 + 56);
    else
      v3 = MEMORY[0x24BDAC9B8];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3321888768;
    block[2] = __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke_2;
    block[3] = &unk_24C223F68;
    v4 = v2;
    block[4] = v7;
    v6 = v4;
    dispatch_async(v3, block);

  }
}

uint64_t __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (NSArray)allDevices
{
  void *v2;
  id v3;
  _BYTE *v4;
  NSArray *v5;
  _BYTE *v7;
  _BYTE v8[64];
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&devices_lock);
  v2 = (void *)all_devices;
  if (!all_devices)
  {
    v9 = 0;
    v10 = 0;
    v11 = 8;
    if (device_table)
    {
      v7 = v8;
      RB::UntypedTable::for_each(device_table, (void (*)(const void *, const void *, void *))RB::Table<objc_object  {objcproto9MTLDevice}*,RBDevice *>::for_each<+[RBDevice allDevices]::$_2>(+[RBDevice allDevices]::$_2)const::{lambda(void const*,void const,void *)#1}::__invoke, &v7);
    }
    v3 = objc_alloc(MEMORY[0x24BDBCE30]);
    if (v9)
      v4 = v9;
    else
      v4 = v8;
    v2 = (void *)objc_msgSend(v3, "initWithObjects:count:", v4, v10);
    all_devices = (uint64_t)v2;
    if (v9)
    {
      free(v9);
      v2 = (void *)all_devices;
    }
  }
  v5 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&devices_lock);
  return v5;
}

+ (unint64_t)defaultGPUPriority
{
  if (HIBYTE(RB::Device::default_gpu_priority))
    return RB::Device::default_gpu_priority;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)setDefaultGPUPriority:(unint64_t)a3
{
  if (a3 > 0xFF)
  {
    if (HIBYTE(RB::Device::default_gpu_priority))
      HIBYTE(RB::Device::default_gpu_priority) = 0;
  }
  else
  {
    RB::Device::default_gpu_priority = a3 | 0x100;
  }
}

+ (unint64_t)defaultBackgroundGPUPriority
{
  if (HIBYTE(RB::Device::default_bg_gpu_priority))
    return RB::Device::default_bg_gpu_priority;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)setDefaultBackgroundGPUPriority:(unint64_t)a3
{
  if (a3 > 0xFF)
  {
    if (HIBYTE(RB::Device::default_bg_gpu_priority))
      HIBYTE(RB::Device::default_bg_gpu_priority) = 0;
  }
  else
  {
    RB::Device::default_bg_gpu_priority = a3 | 0x100;
  }
}

- (void)dealloc
{
  atomic<unsigned int> *p_pending_collect;
  unsigned int v3;
  unsigned int v4;
  objc_super v5;

  *((_QWORD *)self->_device._p + 2) = 0;
  p_pending_collect = &self->_pending_collect;
  do
  {
    while (1)
    {
      v3 = atomic_load(&p_pending_collect->__a_.__a_value);
      v4 = __ldaxr(&p_pending_collect->__a_.__a_value);
      if (v4 == v3)
        break;
      __clrex();
    }
  }
  while (__stlxr(2u, &p_pending_collect->__a_.__a_value));
  v5.receiver = self;
  v5.super_class = (Class)RBDevice;
  -[RBDevice dealloc](&v5, sel_dealloc);
}

- (MTLDevice)device
{
  return (MTLDevice *)*((_QWORD *)self->_device._p + 3);
}

- (MTLCaptureScope)captureScope
{
  return (MTLCaptureScope *)RB::Device::capture_scope((RB::Device *)self->_device._p);
}

- (CGImage)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5
{
  return (CGImage *)render_image((uint64_t)self, a4, (uint64_t)a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5 completionQueue:(id)a6 handler:(id)a7
{
  render_image_async((uint64_t)self, a4, (uint64_t)a5, a6, (uint64_t)a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (void)setAllowsRenderingInBackground:(BOOL)a3
{
  allows_rendering_in_background = a3;
}

+ (BOOL)allowsRenderingInBackground
{
  return allows_rendering_in_background;
}

+ (void)didEnterBackground:(id)a3
{
  NSObject *v3;
  _BOOL8 v4;
  NSArray *v5;
  RB *v6;
  RB *v7;
  uint64_t v8;
  RB *v9;
  RB::Device **v10;
  os_unfair_lock_s *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = RB::misc_log((RB *)a1);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v4)
  {
    *(_DWORD *)buf = 67109376;
    v19 = is_running_in_background;
    v20 = 1024;
    v21 = allows_rendering_in_background;
    _os_log_impl(&dword_209ACA000, v3, OS_LOG_TYPE_INFO, "RBDevice.didEnterBackground: in bg %{BOOL}d, allows bg: %{BOOL}d", buf, 0xEu);
  }
  if (!allows_rendering_in_background)
  {
    RB::ImageProvider::submit_all((RB::ImageProvider *)v4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = +[RBDevice allDevices](RBDevice, "allDevices", 0);
    v6 = (RB *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(RB::Device ***)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
          v11 = (os_unfair_lock_s *)RB::Device::shared_surfaces(v10[1]);
          RB::SharedSurfaceGroup::render_async(v11);
          RB::SharedSurfaceGroup::render_updates((RB::SharedSurfaceGroup *)v11);
          dispatch_sync_f((dispatch_queue_t)objc_msgSend(v10, "queue"), 0, (dispatch_function_t)+[RBDevice didEnterBackground:]::$_4::__invoke);
          v9 = (RB *)((char *)v9 + 1);
        }
        while (v7 != v9);
        v6 = (RB *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v7 = v6;
      }
      while (v6);
    }
    is_running_in_background = 1;
    v12 = RB::misc_log(v6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209ACA000, v12, OS_LOG_TYPE_INFO, "RBDevice.didEnterBackground: done", buf, 2u);
    }
  }
}

+ (void)willEnterForeground:(id)a3
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = RB::misc_log((RB *)a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = is_running_in_background;
    v5 = 1024;
    v6 = allows_rendering_in_background;
    _os_log_impl(&dword_209ACA000, v3, OS_LOG_TYPE_INFO, "RBDevice.willEnterForeground: in bg %{BOOL}d, allows bg: %{BOOL}d", (uint8_t *)v4, 0xEu);
  }
  is_running_in_background = 0;
  if (!allows_rendering_in_background)
    +[RBLayer willEnterForeground]();
}

- (unint64_t)GPUPriority
{
  if (*(unsigned __int16 *)((char *)self->_device._p + 295) >= 0x100u)
    return *(_WORD *)((char *)self->_device._p + 295);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setGPUPriority:(unint64_t)a3
{
  NSObject *v3;
  _QWORD v4[6];

  v3 = *((_QWORD *)self->_device._p + 4);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__RBDevice_setGPUPriority___block_invoke;
  v4[3] = &unk_24C22AB58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(v3, v4);
}

uint64_t __27__RBDevice_setGPUPriority___block_invoke(uint64_t result)
{
  unint64_t v1;
  __int16 v2;

  v1 = *(_QWORD *)(result + 40);
  if (v1 >= 0x100)
    v2 = 0;
  else
    v2 = v1 | 0x100;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 295) = v2;
  return result;
}

- (unint64_t)backgroundGPUPriority
{
  if (*(unsigned __int16 *)((char *)self->_device._p + 293) >= 0x100u)
    return *(_WORD *)((char *)self->_device._p + 293);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setBackgroundGPUPriority:(unint64_t)a3
{
  NSObject *v3;
  _QWORD v4[6];

  v3 = *((_QWORD *)self->_device._p + 4);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__RBDevice_setBackgroundGPUPriority___block_invoke;
  v4[3] = &unk_24C22AB58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(v3, v4);
}

uint64_t __37__RBDevice_setBackgroundGPUPriority___block_invoke(uint64_t result)
{
  unint64_t v1;
  __int16 v2;

  v1 = *(_QWORD *)(result + 40);
  if (v1 >= 0x100)
    v2 = 0;
  else
    v2 = v1 | 0x100;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 293) = v2;
  return result;
}

- (id)pipelineDescriptions:(id)a3 extraColorFormats:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t *v18;
  int v19;
  unsigned int v20;
  Device *p;
  void *pipeline_set;
  id v23;
  void *v24;
  _BYTE v26[40];
  uint64_t v27;
  unsigned int v28;
  char *__endptr;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  int v40;
  uint64_t v41[2];
  uint64_t *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v38 = 0u;
  v39 = 0u;
  v40 = 1065353216;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(a3);
        RB::FormattedRenderState::ID::ID((RB::FormattedRenderState::ID *)v41, (const char *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "UTF8String"));
        std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::__emplace_unique_impl<RB::FormattedRenderState::ID>(&v38, v41);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v7);
  }
  if (*((_QWORD *)&v39 + 1))
  {
    if (objc_msgSend(a4, "count"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v31;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(a4);
            v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              __endptr = (char *)objc_msgSend(v13, "UTF8String");
              v14 = strtol(__endptr, &__endptr, 0);
              if (v14)
              {
                if (*__endptr == 58)
                {
                  v15 = v14;
                  v16 = strtol(__endptr + 1, 0, 0);
                  if (v16)
                  {
                    v17 = v16;
                    std::unordered_set<RB::FormattedRenderState>::unordered_set((uint64_t)v41, (uint64_t)&v38);
                    v18 = v42;
                    if (v42)
                    {
                      v19 = v17 & 0x3FF;
                      do
                      {
                        v27 = v18[2];
                        v20 = *((_DWORD *)v18 + 6);
                        v28 = v20;
                        if ((v20 & 0x3FF) == v15)
                        {
                          v28 = v20 & 0xFFFFFC00 | v19;
                          std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::__emplace_unique_key_args<RB::FormattedRenderState,RB::FormattedRenderState const&>((uint64_t)&v38, (unsigned int *)&v27, (uint64_t)&v27);
                        }
                        v18 = (uint64_t *)*v18;
                      }
                      while (v18);
                    }
                    std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table((uint64_t)v41);
                  }
                }
              }
            }
            ++v12;
          }
          while (v12 != v10);
          v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
        }
        while (v10);
      }
    }
    p = self->_device._p;
    std::unordered_set<RB::FormattedRenderState>::unordered_set((uint64_t)v26, (uint64_t)&v38);
    pipeline_set = (void *)RB::JSONPipeline::make_pipeline_set((RB::Device *)p, (unint64_t)v26);
    std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table((uint64_t)v26);
    v23 = pipeline_set;
  }
  else
  {
    v23 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
  }
  v24 = v23;
  std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table((uint64_t)&v38);
  return v24;
}

- (void).cxx_destruct
{
  Device *p;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  p = self->_device._p;
  if (p)
  {
    v3 = (unsigned int *)((char *)p + 8);
    do
    {
      v4 = __ldxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      __dmb(9u);
      (*(void (**)(Device *))(*(_QWORD *)p + 8))(p);
    }
  }
}

+ (void)allDevices
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  void *result;

  v4 = *a3;
  v5 = *((_QWORD *)*a3 + 9);
  if (*((_QWORD *)*a3 + 10) < (unint64_t)(v5 + 1))
  {
    result = RB::vector<RBDevice *,8ul,unsigned long>::reserve_slow(*a3, v5 + 1);
    v5 = v4[9];
  }
  v6 = (_QWORD *)v4[8];
  if (!v6)
    v6 = v4;
  v6[v5] = a2;
  ++v4[9];
  return result;
}

@end
