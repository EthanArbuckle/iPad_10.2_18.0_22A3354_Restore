@implementation UILabelLayer

id __27___UILabelLayer_setBounds___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UILabelLayer;
  return objc_msgSendSuper2(&v2, sel_setBounds_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id __26___UILabelLayer_setFrame___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UILabelLayer;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __39___UILabelLayer_updateContentLayerSize__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;
  __int128 v5;

  v1 = *(_QWORD **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39___UILabelLayer_updateContentLayerSize__block_invoke_2;
  v3[3] = &__block_descriptor_64_e17_v16__0__CALayer_8l;
  v2 = *(_OWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = v2;
  -[_UILabelLayer _updateLayers:](v1, v3);
}

uint64_t __39___UILabelLayer_updateContentLayerSize__block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __39___UILabelLayer_updateContentLayerSize__block_invoke_3(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

void __39___UILabelLayer_updateContentLayerSize__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "contentsScale");
  objc_msgSend(v4, "setContentsScale:");
  objc_msgSend(*(id *)(a1 + 32), "rasterizationScale");
  objc_msgSend(v4, "setRasterizationScale:");

}

uint64_t __39___UILabelLayer_setNeedsDisplayInRect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsDisplay");
}

uint64_t __33___UILabelLayer__updateSublayers__block_invoke(uint64_t a1)
{
  _UILabelContentLayer *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(_UILabelContentLayer);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "insertSublayer:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0);
}

uint64_t __33___UILabelLayer__updateSublayers__block_invoke_2(uint64_t a1)
{
  _UILabelLightReactiveLayer *v2;
  uint64_t v3;
  void *v4;
  _UILabelLightInertLayer *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init(_UILabelLightReactiveLayer);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_alloc_init(_UILabelLightInertLayer);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C48]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v9);

  objc_msgSend(*(id *)(a1 + 32), "lightContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSublayer:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 1);

  return objc_msgSend(*(id *)(a1 + 32), "insertSublayer:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0);
}

uint64_t __37___UILabelLayer__configureSublayers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_configureUsingLayer:", *(_QWORD *)(a1 + 32));
}

uint64_t __31___UILabelLayer__clearContents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContents:", 0);
}

uint64_t __36___UILabelLayer_setContentsGravity___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentsGravity:", *(_QWORD *)(a1 + 32));
}

uint64_t __47___UILabelLayer_setNeedsDisplayOnBoundsChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsDisplayOnBoundsChange:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __35___UILabelLayer_setContentsFormat___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentsFormat:", *(_QWORD *)(a1 + 32));
}

uint64_t __42___UILabelLayer_setContentsMultiplyColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentsMultiplyColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __34___UILabelLayer_setContentsScale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentsScale:", *(double *)(a1 + 32));
}

@end
