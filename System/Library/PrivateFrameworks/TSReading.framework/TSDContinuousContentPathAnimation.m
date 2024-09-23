@implementation TSDContinuousContentPathAnimation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDContinuousContentPathAnimation;
  -[TSDContinuousContentPathAnimation dealloc](&v3, sel_dealloc);
}

- (void)i_applyToLayer:(id)a3 withTransformBlock:(id)a4 completionBlock:(id)a5
{
  uint64_t (**tick)(id, SEL, double, double);
  uint64_t v10;
  TSDDisplayLink *v11;
  uint64_t v12;
  _QWORD v13[7];
  _QWORD v14[8];
  _QWORD v15[6];
  _OWORD v16[8];
  _OWORD v17[8];

  tick = (uint64_t (**)(id, SEL, double, double))self->_tick;
  if (tick)
  {
    if (self->_isFinished)
    {
      v10 = tick[2](tick, a2, 0.0, 0.0);
      (*((void (**)(_OWORD *__return_ptr, id, uint64_t))a4 + 2))(v17, a4, v10);
      v16[4] = v17[4];
      v16[5] = v17[5];
      v16[6] = v17[6];
      v16[7] = v17[7];
      v16[0] = v17[0];
      v16[1] = v17[1];
      v16[2] = v17[2];
      v16[3] = v17[3];
      objc_msgSend(a3, "setTransform:", v16);
      v11 = objc_alloc_init(TSDDisplayLink);
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3052000000;
      v15[3] = __Block_byref_object_copy__16;
      v15[4] = __Block_byref_object_dispose__16;
      v15[5] = 0;
      v12 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke;
      v14[3] = &unk_24D82CA10;
      v14[4] = self;
      v14[5] = a3;
      v14[6] = a4;
      v14[7] = v15;
      -[TSDDisplayLink setTickBlock:](v11, "setTickBlock:", v14);
      v13[0] = v12;
      v13[1] = 3221225472;
      v13[2] = __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke_2;
      v13[3] = &unk_24D82B510;
      v13[4] = a3;
      v13[5] = a5;
      v13[6] = v15;
      -[TSDDisplayLink setCompletionBlock:](v11, "setCompletionBlock:", v13);
      -[TSDDisplayLink start](v11, "start");
      _Block_object_dispose(v15, 8);
    }
  }
}

uint64_t __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke(_QWORD *a1, double a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _OWORD v8[8];
  _OWORD v9[8];

  v4 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1[4] + 8) + 16))();
  (*(void (**)(_OWORD *__return_ptr))(a1[6] + 16))(v9);
  v5 = (void *)a1[5];
  v8[4] = v9[4];
  v8[5] = v9[5];
  v8[6] = v9[6];
  v8[7] = v9[7];
  v8[0] = v9[0];
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  objc_msgSend(v5, "setTransform:", v8);
  v6 = (*(uint64_t (**)(double))(*(_QWORD *)(a1[4] + 16) + 16))(a2);
  if ((_DWORD)v6)
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = v4;
  return v6;
}

void __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  v2 = (void *)a1[4];
  v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v7[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v7[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v7[0] = *MEMORY[0x24BDE5598];
  v7[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v7[3] = v6;
  objc_msgSend(v2, "setTransform:", v7);
  (*(void (**)(void))(a1[5] + 16))();

}

- (id)tick
{
  return self->_tick;
}

- (void)setTick:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
