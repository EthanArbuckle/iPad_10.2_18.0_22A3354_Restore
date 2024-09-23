@implementation UIClickPresentationInteraction

void __55___UIClickPresentationInteraction__performPresentation__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentationAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = WeakRetained;
    v8 = 1;
    v5 = 9;
    if (!a2)
      v5 = 10;
    objc_msgSend(WeakRetained, "presentationAssistant", v7, v8, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentation");
    v10 = 0;
    v11 = 0;
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setPresentationAssistant:", 0);
    objc_msgSend(WeakRetained, "_endInteractionWithContext:", &v7);

  }
}

uint64_t __55___UIClickPresentationInteraction__performPresentation__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[35])
    {
      objc_msgSend(WeakRetained, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_clickPresentationInteraction:shouldMaintainKeyboardAssertionForFirstResponder:presentation:", v8, v5, v6);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __55___UIClickPresentationInteraction__performPresentation__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_3;
  v3[3] = &unk_1E16BAD68;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[1] = 3221225472;
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v3);

}

uint64_t __55___UIClickPresentationInteraction__performPresentation__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "presentationAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentFromSourcePreview:lifecycleCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_4;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
}

void __55___UIClickPresentationInteraction__performPresentation__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_activeEffect");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endForHandOff");

}

uint64_t __55___UIClickPresentationInteraction__performPresentation__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend(a1[4], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {

    goto LABEL_13;
  }
  v4 = *((_QWORD *)a1[4] + 1);

  if (v4 != 1)
  {
LABEL_13:
    (*((void (**)(void))a1[6] + 2))();
    return;
  }
  objc_msgSend(a1[4], "setInitialLocation:", 1.79769313e308, 1.79769313e308, 1.79769313e308);
  objc_msgSend(a1[4], "setActiveDriver:", a1[5]);
  if (!*((_BYTE *)a1[4] + 48)
    && ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(a1[5], "allowsFeedback")))
  {
    v5 = a1[4];
    if (!v5[31])
    {
LABEL_9:
      v5[49] = 1;
      *((_BYTE *)a1[4] + 48) = 1;
      objc_msgSend(a1[4], "feedbackGenerator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userInteractionStarted");

      goto LABEL_10;
    }
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_clickPresentationInteractionShouldPlayFeedback:", a1[4]);

    if (v7)
    {
      v5 = a1[4];
      goto LABEL_9;
    }
  }
LABEL_10:
  objc_msgSend(a1[4], "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[4];
  if (*((_BYTE *)v10 + 21))
  {
    objc_msgSend(a1[4], "_clickDriverTouch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_2;
    v15[3] = &unk_1E16DAF18;
    v15[4] = a1[4];
    v16 = a1[6];
    objc_msgSend(v9, "_clickPresentationInteraction:shouldBeginWithTouch:completion:", v10, v11, v15);

  }
  else if (*((_BYTE *)v10 + 16))
  {
    v14 = a1[4];
    handleEvent(stateMachineSpec_3, v10[1], 0, (uint64_t)&v14, v10 + 1);
    objc_msgSend(a1[4], "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "clickPresentationInteractionShouldBegin:", a1[4]);

    *((_BYTE *)a1[4] + 51) = v13 ^ 1;
    (*((void (**)(void))a1[6] + 2))();
  }

}

uint64_t __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) = a2 != 0;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return objc_msgSend(*(id *)(a1 + 32), "setActiveDriver:", 0);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    handleEvent(stateMachineSpec_3, *(_QWORD *)(v4 + 8), 0, (uint64_t)&v4, (uint64_t *)(v4 + 8));
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86___UIClickPresentationInteraction__attemptDragLiftAtLocation_useDefaultLiftAnimation___block_invoke(uint64_t a1, int a2)
{
  _BYTE *v3;
  id v4;

  if (a2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "allowsSimultaneousRecognitionDuringLift") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "exclusionRelationshipGestureRecognizer");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_succeed");

    }
  }
  else
  {
    v3 = *(_BYTE **)(a1 + 40);
    if (v3[51])
      -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](v3, 0);
  }
}

void __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained[25])
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_clickPresentationInteraction:liveDragPreviewForPresentation:dragItem:", v4, v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
      objc_msgSend(v9, "setTargetedLiftPreview:", v8);
    }

  }
}

uint64_t __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void (**v9)(void);
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "_fenceHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "_fenceHandler");
          v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v9[2]();

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_3;
  v11[3] = &unk_1E16B1B28;
  v11[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
}

uint64_t __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endInteractionEffectIfNeeded");
}

void __61___UIClickPresentationInteraction__handleTransitionToPreview__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3 && v3[1] == 4)
  {
    if ((_DWORD)a2)
      objc_msgSend(v3, "present");
    else
      objc_msgSend(v3, "_cancelWithReason:alongsideActions:completion:", 11, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

_BYTE *__83___UIClickPresentationInteraction__handleDidTransitionToPossibleFromState_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE *result;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(v2 + 32);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v2 = *(_QWORD *)(a1 + 48);
  }
  if (!*(_QWORD *)(v2 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentation");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

  }
  result = *(_BYTE **)(a1 + 40);
  if ((result[19] || result[30]) && *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16) != 1)
    return (_BYTE *)objc_msgSend(result, "_delegate_interactionEndedWithContext:");
  return result;
}

_UIGravityWellEffect *__60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke(uint64_t a1)
{
  return +[_UIGravityWellEffect effectWithDescriptor:continuationPreview:](_UIGravityWellEffect, "effectWithDescriptor:continuationPreview:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id __60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  if (!v2)
  {
    +[_UIClickHighlightInteractionEffect effectWithPreview:continuingFromPreview:](_UIClickHighlightInteractionEffect, "effectWithPreview:continuingFromPreview:", a1[4], a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[8] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  }
  +[_UIGravityWellAdaptorEffect effectWithAdaptedClickEffect:](_UIGravityWellAdaptorEffect, "effectWithAdaptedClickEffect:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDescriptor:andKey:", a1[6], a1[7]);
  return v6;
}

void __95___UIClickPresentationInteraction__dragInteractionPresentation_sessionDidEnd_withoutBeginning___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[28])
  {
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_clickPresentationInteraction:dragSessionDidEndForItems:", v4, v5);

    v2 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v2, "associatedDragInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "latentAssociatedDragInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "latentAssociatedDragInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setPresentationDelegate:", 0);

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 88);
    *(_QWORD *)(v9 + 88) = 0;

  }
}

@end
