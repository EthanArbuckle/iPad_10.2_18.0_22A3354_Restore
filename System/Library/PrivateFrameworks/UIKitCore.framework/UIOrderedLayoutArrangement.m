@implementation UIOrderedLayoutArrangement

uint64_t __42___UIOrderedLayoutArrangement_setSpacing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSpacing:", *(double *)(a1 + 32));
}

uint64_t __58___UIOrderedLayoutArrangement_setCustomSpacing_afterItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomSpacing:afterItem:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

uint64_t __47___UIOrderedLayoutArrangement_setDistribution___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDistribution:", *(_QWORD *)(a1 + 32));
}

uint64_t __62___UIOrderedLayoutArrangement_setBaselineRelativeArrangement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBaselineRelativeArrangement:", *(unsigned __int8 *)(a1 + 32));
}

id __50___UIOrderedLayoutArrangement_insertItem_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)_UIOrderedLayoutArrangement;
  return objc_msgSendSuper2(&v4, sel_insertItem_atIndex_, v1, v2);
}

uint64_t __71___UIOrderedLayoutArrangement__visibleItemAtEndWithEnumerationOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_itemWantsLayoutAsIfVisible:", a2);
  *a4 = result;
  return result;
}

id __42___UIOrderedLayoutArrangement_removeItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  objc_msgSend(*(id *)(a1 + 32), "_createUnanimatedConfigurationTargetIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "customSpacings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_orderedPropertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customSpacings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  v5 = *(_QWORD *)(a1 + 40);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)_UIOrderedLayoutArrangement;
  return objc_msgSendSuper2(&v7, sel_removeItem_, v5);
}

uint64_t __64___UIOrderedLayoutArrangement__indexOfItemForLocationAttribute___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "_mutableItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = v3 - 1;
    do
    {
      v5 = v4;
      if ((v4 & 0x8000000000000000) != 0)
        break;
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v6, "_itemWantsLayoutAsIfVisible:", v7);

      v4 = v5 - 1;
    }
    while (!(_DWORD)v6);
  }
  else
  {
    v5 = -1;
  }
  if (v5 >= 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = v5;

  return v8;
}

void __79___UIOrderedLayoutArrangement__insertIndividualGuidesAndConstraintsAsNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_setUpMultilineTextWidthDisambiguationConstraintForItem:numberOfVisibleMultilineItems:", v3, *(_QWORD *)(a1 + 48));

}

@end
