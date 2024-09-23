@implementation _UINewCGImageDecompressor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_imageOrError, 0);
}

- (id)initWithSourceImage:(void *)a3 completionQueue:
{
  NSObject *v5;
  uint64_t v6;
  const void *v7;
  int Container;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSourceImage_completionQueue_, a1, CFSTR("_UINewCGImageDecompressor.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageRef != NULL"));

    }
    v17.receiver = a1;
    v17.super_class = (Class)_UINewCGImageDecompressor;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      v6 = CGImageCopySourceData();
      if (v6)
      {
        v7 = (const void *)v6;
        if (+[_UINewCGImageDecompressor _sharedDecompressionSession](_UINewCGImageDecompressor, "_sharedDecompressionSession"))
        {
          Container = CMPhotoDecompressionSessionCreateContainer();
          CFRelease(v7);
          if (Container <= -16994)
          {
            if (Container != -17103 && Container != -17101)
            {
LABEL_19:
              UIDecompressorLog();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134349056;
                v19 = Container;
                _os_log_error_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Error %{public}ld decompressing image -- possibly corrupt", buf, 0xCu);
              }
LABEL_16:

              goto LABEL_17;
            }
          }
          else if ((Container + 16993) >= 4)
          {
            if (!Container)
            {
              dispatch_queue_attr_make_initially_inactive(0);
              v9 = objc_claimAutoreleasedReturnValue();
              v10 = dispatch_queue_create_with_target_V2("com.apple.UIKit.decompressor-reply", v9, v5);
              v11 = (void *)*((_QWORD *)a1 + 3);
              *((_QWORD *)a1 + 3) = v10;

              v12 = dispatch_semaphore_create(0);
              v13 = (void *)*((_QWORD *)a1 + 4);
              *((_QWORD *)a1 + 4) = v12;

              *((_DWORD *)a1 + 10) = 0;
              goto LABEL_18;
            }
            goto LABEL_19;
          }
          UIDecompressorLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134349056;
            v19 = Container;
            _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Internal error %{public}ld creating decompression container", buf, 0xCu);
          }
          goto LABEL_16;
        }
        CFRelease(v7);
      }
LABEL_17:

      a1 = 0;
    }
  }
LABEL_18:

  return a1;
}

+ (CMPhotoDecompressionSession)_sharedDecompressionSession
{
  if (_MergedGlobals_1_12 != -1)
    dispatch_once(&_MergedGlobals_1_12, &__block_literal_global_297);
  return (CMPhotoDecompressionSession *)qword_1ECD79E30;
}

- (void)dealloc
{
  CMPhotoDecompressionContainer *container;
  objc_super v4;

  container = self->_container;
  if (container)
    CFRelease(container);
  v4.receiver = self;
  v4.super_class = (Class)_UINewCGImageDecompressor;
  -[_UINewCGImageDecompressor dealloc](&v4, sel_dealloc);
}

- (CGImage)waitForImageRef
{
  os_unfair_lock_s *p_stateLock;
  NSObject *v4;
  int ImageForIndex;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *replyQueue;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      replyQueue = self->_replyQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44___UINewCGImageDecompressor_waitForImageRef__block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(replyQueue, block);
      UIDecompressorLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_185066000, v10, OS_LOG_TYPE_DEBUG, "Async decode in progress; blocking sync decode on semaphore",
          buf,
          2u);
      }

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    UIDecompressorLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_185066000, v4, OS_LOG_TYPE_DEBUG, "Sync decode beginning", buf, 2u);
    }

    *(_BYTE *)&self->_flags |= 1u;
    ImageForIndex = CMPhotoDecompressionContainerCreateImageForIndex();
    UIDecompressorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (ImageForIndex)
    {
      if (v7)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v14) = ImageForIndex;
        _os_log_debug_impl(&dword_185066000, v6, OS_LOG_TYPE_DEBUG, "Sync decode failed with error=(OSStatus) %d", buf, 8u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], ImageForIndex, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINewCGImageDecompressor _finishDecompressingWithImage:error:](self, "_finishDecompressingWithImage:error:", 0, v8);

    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 134217984;
        v14 = 0;
        _os_log_debug_impl(&dword_185066000, v6, OS_LOG_TYPE_DEBUG, "Sync decode finished with image=%p", buf, 0xCu);
      }

      -[_UINewCGImageDecompressor _finishDecompressingWithImage:error:](self, "_finishDecompressingWithImage:error:", 0, 0);
      CGImageRelease(0);
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return 0;
  else
    return (CGImage *)self->_imageOrError;
}

- (void)_finishDecompressingWithImage:(CGImage *)a3 error:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  CGImageRef v10;
  id imageOrError;
  NSObject *v12;
  CMPhotoDecompressionContainer *container;
  CGImage *v14;
  int v15;
  CGImage *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a3)
  {
    UIDecompressorLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134217984;
      v16 = a3;
      _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "Decode finished with image=%p", (uint8_t *)&v15, 0xCu);
    }

    v10 = CGImageRetain(a3);
    imageOrError = self->_imageOrError;
    self->_imageOrError = v10;

  }
  else if (v7)
  {
    UIDecompressorLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "domain");
      v14 = (CGImage *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v14;
      v17 = 1024;
      v18 = objc_msgSend(v8, "code");
      _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "Decode failed with error.domain=%@ error.code=%d", (uint8_t *)&v15, 0x12u);

    }
    objc_storeStrong(&self->_imageOrError, a4);
    *(_BYTE *)&self->_flags |= 4u;
  }
  container = self->_container;
  if (container)
  {
    CFRelease(container);
    self->_container = 0;
  }
  *(_BYTE *)&self->_flags |= 2u;
  dispatch_activate((dispatch_object_t)self->_replyQueue);

}

- (void)decompressAsync:(uint64_t)a1
{
  id v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  id *v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, int, uint64_t, CGImage *);
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[16];

  v3 = a2;
  if (a1)
  {
    v4 = os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 40));
    if (!v4 || (*(_BYTE *)(a1 + 44) & 1) != 0)
    {
      UIDecompressorLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "Async decode lost race, enqueueing deferred reply", buf, 2u);
      }

      v15 = *(NSObject **)(a1 + 24);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __45___UINewCGImageDecompressor_decompressAsync___block_invoke;
      v26[3] = &unk_1E16B1D18;
      v26[4] = a1;
      v7 = &v27;
      v27 = v3;
      dispatch_async(v15, v26);
      if (v4)
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    }
    else
    {
      UIDecompressorLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "Async decode beginning", buf, 2u);
      }

      *(_BYTE *)(a1 + 44) |= 1u;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      v6 = MEMORY[0x1E0C809B0];
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __45___UINewCGImageDecompressor_decompressAsync___block_invoke_15;
      v23 = &unk_1E16CC8A0;
      v24 = a1;
      v7 = &v25;
      v8 = v3;
      v25 = v8;
      v9 = CMPhotoDecompressionContainerDecodeImageForIndexAsync();
      if (v9)
      {
        v10 = v9;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "_finishDecompressingWithImage:error:", 0, v11);
        v12 = *(NSObject **)(a1 + 24);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __45___UINewCGImageDecompressor_decompressAsync___block_invoke_18;
        block[3] = &unk_1E16CC8C8;
        v19 = v10;
        v17 = v11;
        v18 = v8;
        v13 = v11;
        dispatch_async(v12, block);

      }
    }

  }
}

- (_UINewCGImageDecompressor)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Must call designated intializer"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end
