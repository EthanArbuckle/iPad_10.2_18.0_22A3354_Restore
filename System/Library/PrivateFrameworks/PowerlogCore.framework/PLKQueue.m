@implementation PLKQueue

- (PLKQueue)initWithPath:(id)a3 withDispatchQueue:(id)a4 withBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLKQueue *v12;
  PLKQueue *v13;
  uint64_t v14;
  id kQueueBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLKQueue;
  v12 = -[PLKQueue init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_path, a3);
    objc_storeStrong((id *)&v13->_dispatchQueue, a4);
    *(_QWORD *)&v13->_kQueue = -1;
    v13->_kqueueDescriptorSource = 0;
    v13->_kqueueDescriptorRef = 0;
    v14 = MEMORY[0x1BCC9EB70](v11);
    kQueueBlock = v13->_kQueueBlock;
    v13->_kQueueBlock = (id)v14;

  }
  return v13;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  PLKQueue *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int i;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  __CFRunLoop *v31;
  __CFRunLoopSource *v32;
  unsigned int j;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CFFileDescriptorNativeDescriptor v56;
  const __CFAllocator *v57;
  __CFRunLoop *Main;
  __CFRunLoopSource *v59;
  const char *v60;
  int v61;
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD block[5];
  _QWORD v65[5];
  CFFileDescriptorContext buf;
  kevent changelist;
  uint64_t v68;

  v3 = a3;
  v68 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v4->_enabled = v3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __23__PLKQueue_setEnabled___block_invoke;
    v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v65[4] = v5;
    if (setEnabled__defaultOnce != -1)
      dispatch_once(&setEnabled__defaultOnce, v65);
    if (setEnabled__classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromBOOL();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("PLKQueue.setEnabled: enabled=%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLKQueue setEnabled:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 53);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLIOHIDOperatorComposition initWithOperator:forService:].cold.1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);

    }
  }
  if (v3)
  {
    if (-[PLKQueue kQueue](v4, "kQueue") != -1)
      goto LABEL_53;
    -[PLKQueue setFileDescriptor:](v4, "setFileDescriptor:", 0xFFFFFFFFLL);
    for (i = 6; i > 1; --i)
    {
      if (-[PLKQueue fileDescriptor](v4, "fileDescriptor") > 0)
        break;
      *__error() = 0;
      -[PLKQueue path](v4, "path");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[PLKQueue setFileDescriptor:](v4, "setFileDescriptor:", open((const char *)objc_msgSend(v20, "fileSystemRepresentation"), 0x8000));

      if (-[PLKQueue fileDescriptor](v4, "fileDescriptor") <= 0)
      {
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v21 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __23__PLKQueue_setEnabled___block_invoke_13;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (setEnabled__defaultOnce_11 != -1)
            dispatch_once(&setEnabled__defaultOnce_11, block);
          if (setEnabled__classDebugEnabled_12)
          {
            v22 = (void *)MEMORY[0x1E0CB3940];
            v23 = -[PLKQueue fileDescriptor](v4, "fileDescriptor");
            v24 = *__error();
            v25 = __error();
            objc_msgSend(v22, "stringWithFormat:", CFSTR("PLKQueue.enabled error! fileDescriptor=%d errno=%d-%s"), v23, v24, strerror(*v25));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLKQueue setEnabled:]");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v28, v29, 63);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf.version) = 138412290;
              *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v26;
              _os_log_debug_impl(&dword_1B6AB6000, v30, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }

          }
        }
        sleep(1u);
      }
    }
    if (-[PLKQueue fileDescriptor](v4, "fileDescriptor") < 1)
    {
      v60 = "self.fileDescriptor > 0";
      v61 = 68;
    }
    else
    {
      for (j = 6; j > 1; --j)
      {
        if (-[PLKQueue kQueue](v4, "kQueue") > 0)
          break;
        *__error() = 0;
        -[PLKQueue setKQueue:](v4, "setKQueue:", kqueue());
        if (-[PLKQueue kQueue](v4, "kQueue") <= 0)
        {
          if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
          {
            v34 = objc_opt_class();
            v63[0] = MEMORY[0x1E0C809B0];
            v63[1] = 3221225472;
            v63[2] = __23__PLKQueue_setEnabled___block_invoke_20;
            v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v63[4] = v34;
            if (setEnabled__defaultOnce_18 != -1)
              dispatch_once(&setEnabled__defaultOnce_18, v63);
            if (setEnabled__classDebugEnabled_19)
            {
              v35 = (void *)MEMORY[0x1E0CB3940];
              v36 = -[PLKQueue kQueue](v4, "kQueue");
              v37 = *__error();
              v38 = __error();
              objc_msgSend(v35, "stringWithFormat:", CFSTR("PLKQueue.enabled error! kQueue=%d errno=%d-%s"), v36, v37, strerror(*v38));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "lastPathComponent");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLKQueue setEnabled:]");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v41, v42, 75);

              PLLogCommon();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf.version) = 138412290;
                *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v39;
                _os_log_debug_impl(&dword_1B6AB6000, v43, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
              }

            }
          }
          sleep(1u);
        }
      }
      if (-[PLKQueue kQueue](v4, "kQueue") > 0)
      {
        changelist.ident = -[PLKQueue fileDescriptor](v4, "fileDescriptor");
        *(_QWORD *)&changelist.filter = 0x7F0025FFFCLL;
        changelist.data = 0;
        changelist.udata = &v4->_fileDescriptor;
        if (kevent(-[PLKQueue kQueue](v4, "kQueue"), &changelist, 1, 0, 0, 0) == -1)
        {
          if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
          {
            v44 = objc_opt_class();
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __23__PLKQueue_setEnabled___block_invoke_26;
            v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v62[4] = v44;
            if (setEnabled__defaultOnce_24 != -1)
              dispatch_once(&setEnabled__defaultOnce_24, v62);
            if (setEnabled__classDebugEnabled_25)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to setup kQueue"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "lastPathComponent");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLKQueue setEnabled:]");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v47, v48, 89);

              PLLogCommon();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                -[PLIOHIDOperatorComposition initWithOperator:forService:].cold.1((uint64_t)v45, v49, v50, v51, v52, v53, v54, v55);

            }
          }
          +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 102);
        }
        buf.version = 0;
        memset(&buf.retain, 0, 24);
        buf.info = v4;
        v56 = -[PLKQueue kQueue](v4, "kQueue");
        v57 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        -[PLKQueue setKqueueDescriptorRef:](v4, "setKqueueDescriptorRef:", CFFileDescriptorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v56, 1u, (CFFileDescriptorCallBack)kQueueEvent, &buf));
        CFFileDescriptorEnableCallBacks(-[PLKQueue kqueueDescriptorRef](v4, "kqueueDescriptorRef"), 1uLL);
        -[PLKQueue setKqueueDescriptorSource:](v4, "setKqueueDescriptorSource:", CFFileDescriptorCreateRunLoopSource(v57, -[PLKQueue kqueueDescriptorRef](v4, "kqueueDescriptorRef"), 0));
        Main = CFRunLoopGetMain();
        v59 = -[PLKQueue kqueueDescriptorSource](v4, "kqueueDescriptorSource");
        CFRunLoopAddSource(Main, v59, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
        goto LABEL_53;
      }
      v60 = "self.kQueue > 0";
      v61 = 80;
    }
    __assert_rtn("-[PLKQueue setEnabled:]", "PLKQueue.m", v61, v60);
  }
  if (-[PLKQueue kqueueDescriptorSource](v4, "kqueueDescriptorSource"))
  {
    v31 = CFRunLoopGetMain();
    v32 = -[PLKQueue kqueueDescriptorSource](v4, "kqueueDescriptorSource");
    CFRunLoopRemoveSource(v31, v32, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    CFRelease(-[PLKQueue kqueueDescriptorSource](v4, "kqueueDescriptorSource"));
    -[PLKQueue setKqueueDescriptorSource:](v4, "setKqueueDescriptorSource:", 0);
  }
  if (-[PLKQueue kqueueDescriptorRef](v4, "kqueueDescriptorRef"))
  {
    CFFileDescriptorInvalidate(-[PLKQueue kqueueDescriptorRef](v4, "kqueueDescriptorRef"));
    CFRelease(-[PLKQueue kqueueDescriptorRef](v4, "kqueueDescriptorRef"));
    -[PLKQueue setKqueueDescriptorRef:](v4, "setKqueueDescriptorRef:", 0);
    -[PLKQueue setKQueue:](v4, "setKQueue:", 0xFFFFFFFFLL);
  }
  if (-[PLKQueue fileDescriptor](v4, "fileDescriptor") != -1)
  {
    close(-[PLKQueue fileDescriptor](v4, "fileDescriptor"));
    -[PLKQueue setFileDescriptor:](v4, "setFileDescriptor:", 0xFFFFFFFFLL);
  }
LABEL_53:
  objc_sync_exit(v4);

}

BOOL __23__PLKQueue_setEnabled___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setEnabled__classDebugEnabled = result;
  return result;
}

BOOL __23__PLKQueue_setEnabled___block_invoke_13(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setEnabled__classDebugEnabled_12 = result;
  return result;
}

BOOL __23__PLKQueue_setEnabled___block_invoke_20(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setEnabled__classDebugEnabled_19 = result;
  return result;
}

BOOL __23__PLKQueue_setEnabled___block_invoke_26(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setEnabled__classDebugEnabled_25 = result;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int)kQueue
{
  return self->_kQueue;
}

- (void)setKQueue:(int)a3
{
  self->_kQueue = a3;
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

- (__CFRunLoopSource)kqueueDescriptorSource
{
  return self->_kqueueDescriptorSource;
}

- (void)setKqueueDescriptorSource:(__CFRunLoopSource *)a3
{
  self->_kqueueDescriptorSource = a3;
}

- (__CFFileDescriptor)kqueueDescriptorRef
{
  return self->_kqueueDescriptorRef;
}

- (void)setKqueueDescriptorRef:(__CFFileDescriptor *)a3
{
  self->_kqueueDescriptorRef = a3;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)kQueueBlock
{
  return self->_kQueueBlock;
}

- (void)setKQueueBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_kQueueBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
