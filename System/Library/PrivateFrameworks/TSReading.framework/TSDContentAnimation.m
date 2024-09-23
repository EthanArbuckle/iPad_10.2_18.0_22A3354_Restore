@implementation TSDContentAnimation

+ (id)animation
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)i_applyToLayer:(id)a3 withTransformBlock:(id)a4 completionBlock:(id)a5
{
  id v9;
  _QWORD v10[7];

  if (-[TSDContentAnimation i_canProduceAnimation](self, "i_canProduceAnimation"))
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__TSDContentAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke;
    v10[3] = &unk_24D82C9E8;
    v10[5] = self;
    v10[6] = a5;
    v10[4] = a3;
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v10);
    v9 = -[TSDContentAnimation i_animationWithTransformBlock:](self, "i_animationWithTransformBlock:", a4);
    objc_msgSend(v9, "setRemovedOnCompletion:", 0);
    objc_msgSend(v9, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(a3, "addAnimation:forKey:", v9, CFSTR("contentAnimation"));
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

uint64_t __73__TSDContentAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeAnimationForKey:", CFSTR("contentAnimation"));
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "i_endLocation"));
}

- (BOOL)i_canProduceAnimation
{
  return 0;
}

- (id)i_animationWithTransformBlock:(id)a3
{
  return 0;
}

- (id)i_endLocation
{
  return 0;
}

@end
