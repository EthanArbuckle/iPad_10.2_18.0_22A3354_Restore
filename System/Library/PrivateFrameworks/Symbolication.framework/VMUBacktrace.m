@implementation VMUBacktrace

- (void)dealloc
{
  unint64_t *frames;
  unint64_t *framePtrs;
  unint64_t *v5;
  objc_super v6;

  frames = self->_callstack.frames;
  if (frames)
    free(frames);
  framePtrs = self->_callstack.framePtrs;
  if (framePtrs)
    free(framePtrs);
  v5 = self->_asyncCallstack.frames;
  if (v5)
    free(v5);
  v6.receiver = self;
  v6.super_class = (Class)VMUBacktrace;
  -[VMUBacktrace dealloc](&v6, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (VMUBacktrace)initWithSamplingContext:(sampling_context_t *)a3 thread:(unsigned int)a4 recordFramePointers:(BOOL)a5
{
  _BOOL4 v5;
  VMUBacktrace *v8;
  VMUBacktrace *v9;
  VMUBacktrace *v10;
  objc_super v12;
  _BYTE v13[4096];
  _QWORD v14[1537];

  v5 = a5;
  v14[1536] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VMUBacktrace;
  v8 = -[VMUBacktrace init](&v12, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_7;
  if (a3)
  {
    if (!sample_remote_thread_with_dispatch_queue_regular_and_swift_async())
    {
      copySamplingResultToCallstack(&v9->_callstack.context.pid, a4, v14, v13, 0, v5);
LABEL_7:
      v9 = v9;
      v10 = v9;
      goto LABEL_8;
    }
  }
  else
  {

    v9 = 0;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (unsigned)backtraceLength
{
  return self->_callstack.length;
}

- (unsigned)thread
{
  return self->_callstack.context.thread;
}

- (unint64_t)dispatchQueueSerialNumber
{
  return self->_callstack.context.dispatch_queue_serial_num;
}

- (unint64_t)backtrace
{
  return self->_callstack.frames;
}

- (void)fixupStackWithSamplingContext:(sampling_context_t *)a3 symbolicator:(_CSTypeRef)a4
{
  int flavor;

  flavor = self->_flavor;
  if (flavor > 63)
  {
    if (flavor != 64 && flavor != 65)
      goto LABEL_4;
  }
  else if (flavor != 32 && flavor != 33)
  {
LABEL_4:
    NSLog(CFSTR("unsupported flavor %d, skipping fixup"), a2, a3, a4._opaque_1, a4._opaque_2, &self->_flavor, self->_flavor);
    return;
  }
  CSSymbolicatorFixupFrames();
  if (self->_asyncCallstack.length)
    CSSymbolicatorFixupFrames();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUBacktrace)initWithCoder:(id)a3
{
  id v4;
  VMUBacktrace *v5;
  id v6;
  uint64_t v7;
  uint64_t length;
  const void *v9;
  uint64_t v10;
  unint64_t *v11;
  id v12;
  const void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  VMUBacktrace *v30;
  unint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  unint64_t *v35;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t *v55;
  size_t v56;
  size_t __n;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)VMUBacktrace;
  v5 = -[VMUBacktrace init](&v58, sel_init);
  if (!v5)
    goto LABEL_15;
  v5->_callstack.context.pid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));
  v5->_callstack.context.run_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("run_state"));
  v5->_callstack.context.dispatch_queue_serial_num = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dispatch_queue_serial_num"));
  v5->_callstack.context.thread = objc_msgSend(v4, "decodeIntForKey:", CFSTR("thread"));
  v5->_callstack.length = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("length"));
  v5->_asyncCallstack.length = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("asyncLength"));
  __n = 0;
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("frames"), &__n);
  length = v5->_callstack.length;
  if (__n != 8 * length)
  {
    v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v22)
      -[VMUBacktrace initWithCoder:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_9;
  }
  v9 = (const void *)v7;
  v10 = 8 * length;
  v11 = (unint64_t *)malloc_type_malloc(8 * length, 0xD3F1B0CEuLL);
  v5->_callstack.frames = v11;
  memcpy(v11, v9, __n);
  __n = 0;
  v12 = objc_retainAutorelease(v6);
  v13 = (const void *)objc_msgSend(v12, "decodeBytesForKey:returnedLength:", CFSTR("framePtrs"), &__n);
  if (__n == v10 || !__n)
  {
    if (__n)
    {
      v31 = (unint64_t *)malloc_type_malloc(__n, 0xA81435DEuLL);
      v5->_callstack.framePtrs = v31;
      memcpy(v31, v13, __n);
    }
    else
    {
      v37 = objc_msgSend(objc_retainAutorelease(v12), "decodeBytesForKey:returnedLength:", CFSTR("framePtr"), &__n);
      if ((__n & 0xFFFFFFFFFFFFFFF7) != 0)
      {
        v38 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v38)
          -[VMUBacktrace initWithCoder:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);
        goto LABEL_9;
      }
      if (__n)
      {
        v54 = (unint64_t *)v37;
        v55 = (unint64_t *)malloc_type_calloc(v5->_callstack.length, 8uLL, 0x100004000313F17uLL);
        v5->_callstack.framePtrs = v55;
        *v55 = *v54;
      }
    }
    if (v5->_asyncCallstack.length)
    {
      v56 = 0;
      v32 = objc_msgSend(objc_retainAutorelease(v12), "decodeBytesForKey:returnedLength:", CFSTR("asyncFrames"), &v56);
      v33 = v5->_asyncCallstack.length;
      if (v56 != 8 * v33)
      {
        v46 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v46)
          -[VMUBacktrace initWithCoder:].cold.2(v46, v47, v48, v49, v50, v51, v52, v53);
        goto LABEL_9;
      }
      v34 = (const void *)v32;
      v35 = (unint64_t *)malloc_type_malloc(8 * v33, 0xFC6C52D1uLL);
      v5->_asyncCallstack.frames = v35;
      memcpy(v35, v34, v56);
    }
LABEL_15:
    v30 = v5;
    goto LABEL_16;
  }
  v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v14)
    -[VMUBacktrace initWithCoder:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_9:
  v30 = 0;
LABEL_16:

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  unint64_t *framePtrs;
  uint64_t length;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInt32:forKey:", self->_callstack.context.pid, CFSTR("pid"));
  objc_msgSend(v7, "encodeInt:forKey:", self->_callstack.context.run_state, CFSTR("run_state"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_callstack.context.dispatch_queue_serial_num, CFSTR("dispatch_queue_serial_num"));
  objc_msgSend(v7, "encodeInt:forKey:", self->_callstack.context.thread, CFSTR("thread"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_callstack.length, CFSTR("length"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_asyncCallstack.length, CFSTR("asyncLength"));
  v4 = 8 * self->_callstack.length;
  objc_msgSend(v7, "encodeBytes:length:forKey:", self->_callstack.frames, v4, CFSTR("frames"));
  framePtrs = self->_callstack.framePtrs;
  if (framePtrs)
  {
    objc_msgSend(v7, "encodeBytes:length:forKey:", framePtrs, v4, CFSTR("framePtrs"));
    objc_msgSend(v7, "encodeBytes:length:forKey:", self->_callstack.framePtrs, 8, CFSTR("framePtr"));
  }
  length = self->_asyncCallstack.length;
  if ((_DWORD)length)
    objc_msgSend(v7, "encodeBytes:length:forKey:", self->_asyncCallstack.frames, 8 * length, CFSTR("asyncFrames"));

}

- (_CSTypeRef)_symbolicator
{
  BOOL v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _CSTypeRef result;

  if (_symbolicator_previousPid)
    v2 = _symbolicator_previousPid == self->_callstack.context.pid;
  else
    v2 = 0;
  if (!v2)
  {
    _symbolicator_previousPid = self->_callstack.context.pid;
    CSRelease();
    if (self->_callstack.context.pid)
    {
      _symbolicator_symbolicator_0 = CSSymbolicatorCreateWithPid();
      _symbolicator_symbolicator_1 = v4;
    }
  }
  v5 = _symbolicator_symbolicator_0;
  v6 = _symbolicator_symbolicator_1;
  result._opaque_2 = v6;
  result._opaque_1 = v5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VMUBacktrace *v4;
  VMUBacktrace *v5;
  __int128 v6;
  __int128 v7;
  unint64_t *v8;
  __int128 v9;
  __int128 v10;
  uint64_t length;
  unint64_t *v12;

  v4 = -[VMUBacktrace init](+[VMUBacktrace allocWithZone:](VMUBacktrace, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->_flavor = self->_flavor;
    v6 = *(_OWORD *)&self->_callstack.context.pid;
    v7 = *(_OWORD *)&self->_callstack.context.dispatch_queue_serial_num;
    *(_OWORD *)&v4->_callstack.framePtrs = *(_OWORD *)&self->_callstack.framePtrs;
    *(_OWORD *)&v4->_callstack.context.dispatch_queue_serial_num = v7;
    *(_OWORD *)&v4->_callstack.context.pid = v6;
    v8 = (unint64_t *)malloc_type_malloc(8 * self->_callstack.length, 0x100004000313F17uLL);
    v5->_callstack.frames = v8;
    memcpy(v8, self->_callstack.frames, 8 * self->_callstack.length);
    if (self->_callstack.framePtrs)
    {
      v5->_callstack.framePtrs = (unint64_t *)malloc_type_malloc(8 * self->_callstack.length, 0x100004000313F17uLL);
      memcpy(v5->_callstack.frames, self->_callstack.frames, 8 * self->_callstack.length);
    }
    v9 = *(_OWORD *)&self->_asyncCallstack.context.pid;
    v10 = *(_OWORD *)&self->_asyncCallstack.context.dispatch_queue_serial_num;
    *(_OWORD *)&v5->_asyncCallstack.framePtrs = *(_OWORD *)&self->_asyncCallstack.framePtrs;
    *(_OWORD *)&v5->_asyncCallstack.context.dispatch_queue_serial_num = v10;
    *(_OWORD *)&v5->_asyncCallstack.context.pid = v9;
    length = self->_asyncCallstack.length;
    if ((_DWORD)length)
    {
      v12 = (unint64_t *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
      v5->_asyncCallstack.frames = v12;
      memcpy(v12, self->_asyncCallstack.frames, 8 * self->_asyncCallstack.length);
    }
  }
  return v5;
}

- (id)description
{
  int flavor;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[VMUBacktrace _symbolicator](self, "_symbolicator");
  flavor = self->_flavor;
  if (flavor > 63)
  {
    if (flavor != 64)
    {
      if (flavor == 65)
      {
        v4 = CFSTR("ARM LR");
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    v4 = CFSTR("ARM Simple");
  }
  else
  {
    if (flavor != 32)
    {
      if (flavor == 33)
      {
        v4 = CFSTR("I386 ESP");
        goto LABEL_11;
      }
LABEL_8:
      v4 = CFSTR("unknown");
      goto LABEL_11;
    }
    v4 = CFSTR("I386 Simple");
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VMUBacktrace (Flavor: %@ Time: %llu Process: %d Thread: %X  Dispatch queue serial num: %lld)\n"), v4, self->_timestamp, self->_callstack.context.pid, self->_callstack.context.thread, self->_callstack.context.dispatch_queue_serial_num);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  descriptionForCallstackFrames((uint64_t)&self->_callstack, CFSTR("Frames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_asyncCallstack.length)
  {
    descriptionForCallstackFrames((uint64_t)&self->_asyncCallstack, CFSTR("Async Frames"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

- (unint64_t)stackFramePointers
{
  return self->_callstack.framePtrs;
}

- (void)setThreadState:(int)a3
{
  self->_callstack.context.run_state = a3;
}

- (int)threadState
{
  return self->_callstack.context.run_state;
}

- (unint64_t)asyncBacktrace
{
  return self->_asyncCallstack.frames;
}

- (unsigned)asyncBacktraceLength
{
  return self->_asyncCallstack.length;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "Expect the size of VMUBacktrace decoded frame pointers to be 0 (if none were encoded) or to match callstack length.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "Expect the size of VMUBacktrace decoded frames to match callstack length.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "Expect the size of VMUBacktrace decoded frame pointer to be 0 (if none were encoded) or sizeof(mach_vm_address_t) if one was encoded.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
