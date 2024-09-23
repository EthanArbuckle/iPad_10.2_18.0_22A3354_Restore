@implementation UIAccessibilityHitTestOptions

+ (id)defaultOptions
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setLeafNodePredicate:", &__block_literal_global_17);
  objc_msgSend(v2, "setFallbackPredicate:", &__block_literal_global_176_0);
  objc_msgSend(v2, "setIsEligibleElement:", &__block_literal_global_177);
  return v2;
}

uint64_t __47__UIAccessibilityHitTestOptions_defaultOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

uint64_t __47__UIAccessibilityHitTestOptions_defaultOptions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityIsTouchContainer");
}

uint64_t __47__UIAccessibilityHitTestOptions_defaultOptions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isAccessibilityElement") & 1) != 0
    || (objc_msgSend(v2, "_accessibilityIsTouchContainer") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "accessibilityViewIsModal");
  }

  return v3;
}

+ (id)dwellControlElementHighlightOptions
{
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = objc_alloc_init((Class)a1);
  objc_msgSend(v3, "setShouldHitTestUserTestingChildren:", 1);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_2;
  v11[3] = &unk_1E3DFE7D0;
  v12 = &__block_literal_global_178_0;
  objc_msgSend(v3, "setLeafNodePredicate:", v11);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_4;
  v8[3] = &unk_1E3DFFC58;
  v9 = &__block_literal_global_178_0;
  v10 = a1;
  objc_msgSend(v3, "setFallbackPredicate:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_6;
  v6[3] = &unk_1E3DFE7D0;
  v7 = &__block_literal_global_178_0;
  objc_msgSend(v3, "setIsEligibleElement:", v6);

  return v3;
}

BOOL __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement")
    && objc_msgSend(v2, "accessibilityRespondsToUserInteraction"))
  {
    v3 = objc_msgSend(v2, "accessibilityTraits");
    v4 = ((*MEMORY[0x1E0CEB100] | UIAccessibilityTraitIsEditing) & v3) == 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    NSClassFromString(CFSTR("SwiftUI.AccessibilityNode"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_3;
      v9[3] = &unk_1E3DFE7D0;
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", v9, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = *MEMORY[0x1E0CF44D8] | *MEMORY[0x1E0CF4440] | *MEMORY[0x1E0CF4528] | *MEMORY[0x1E0CF43F8] | *MEMORY[0x1E0CF4580];
        v6 = (objc_msgSend(v3, "accessibilityTraits") & v5) != 0;
        v7 = v10;
LABEL_8:

        goto LABEL_9;
      }

    }
    objc_msgSend(v3, "automationElements");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count") == 0;
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_4(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_5;
  v7[3] = &unk_1E3DFE7D0;
  v3 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", v7, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = 0;
  else
    v5 = v2;

  return v5;
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "_accessibilityIsRemoteElement");

  return v4;
}

- (id)leafNodePredicate
{
  return self->_leafNodePredicate;
}

- (void)setLeafNodePredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)fallbackPredicate
{
  return self->_fallbackPredicate;
}

- (void)setFallbackPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)isEligibleElement
{
  return self->_isEligibleElement;
}

- (void)setIsEligibleElement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldHitTestUserTestingChildren
{
  return self->_shouldHitTestUserTestingChildren;
}

- (void)setShouldHitTestUserTestingChildren:(BOOL)a3
{
  self->_shouldHitTestUserTestingChildren = a3;
}

- (NSArray)outOfBoundsHitTestElements
{
  return self->_outOfBoundsHitTestElements;
}

- (void)setOutOfBoundsHitTestElements:(id)a3
{
  objc_storeStrong((id *)&self->_outOfBoundsHitTestElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outOfBoundsHitTestElements, 0);
  objc_storeStrong(&self->_isEligibleElement, 0);
  objc_storeStrong(&self->_fallbackPredicate, 0);
  objc_storeStrong(&self->_leafNodePredicate, 0);
}

@end
