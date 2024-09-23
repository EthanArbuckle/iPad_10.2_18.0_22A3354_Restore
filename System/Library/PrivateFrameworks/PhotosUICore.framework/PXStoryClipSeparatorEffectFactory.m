@implementation PXStoryClipSeparatorEffectFactory

+ ($AEFAD17AB1CC80BF212AA0D0E83A8824)parametersForPanTowardsEdge:(SEL)a3 distance:(unsigned int)a4
{
  if (a5 < 0.0)
    return ($AEFAD17AB1CC80BF212AA0D0E83A8824 *)-[$AEFAD17AB1CC80BF212AA0D0E83A8824 parametersForPanTowardsEdge:distance:](result, "parametersForPanTowardsEdge:distance:", PXRectEdgeOpposite(), -a5);
  retstr->var0 = a4;
  retstr->var1 = a5;
  retstr->var2 = 0.0;
  return result;
}

+ ($AEFAD17AB1CC80BF212AA0D0E83A8824)parametersForRotationWithAngle:(SEL)a3
{
  retstr->var0 = 42;
  retstr->var1 = 0.0;
  retstr->var2 = a4;
  return result;
}

+ (void)getParameters:(id *)a3 forParallelPansWithDistance:(double)a4 threeUpComposition:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  double v16;

  v9 = a5;
  if (objc_msgSend(v9, "numberOfClips") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.numberOfClips == 3"));

  }
  v10 = objc_retainAutorelease(v9);
  v11 = *(_QWORD *)objc_msgSend(v10, "dividerAxes");
  v12 = objc_retainAutorelease(v10);
  if (v11 != *(_QWORD *)(objc_msgSend(v12, "dividerAxes") + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.dividerAxes[0] == composition.dividerAxes[1]"));

  }
  objc_msgSend(v12, "mainDividerAxis");
  PXAxisTransposed();
  objc_msgSend(a1, "parametersForPanTowardsEdge:distance:", PXMaxRectEdgeForAxis(), a4);
  *(_OWORD *)&a3[1].var0 = v15;
  a3[1].var2 = v16;
  *(_OWORD *)&a3->var0 = *(_OWORD *)&a3[1].var0;
  a3->var2 = v16;

}

+ (void)getParameters:(id *)a3 forOppositePansWithDistance:(double)a4 threeUpComposition:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  double v17;

  v9 = a5;
  if (objc_msgSend(v9, "numberOfClips") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.numberOfClips == 3"));

  }
  v10 = objc_retainAutorelease(v9);
  v11 = *(_QWORD *)objc_msgSend(v10, "dividerAxes");
  v12 = objc_retainAutorelease(v10);
  if (v11 != *(_QWORD *)(objc_msgSend(v12, "dividerAxes") + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.dividerAxes[0] == composition.dividerAxes[1]"));

  }
  objc_msgSend(v12, "mainDividerAxis");
  PXAxisTransposed();
  v13 = PXMaxRectEdgeForAxis();
  objc_msgSend(a1, "parametersForPanTowardsEdge:distance:", v13, a4);
  *(_OWORD *)&a3->var0 = v16;
  a3->var2 = v17;
  objc_msgSend(a1, "parametersForPanTowardsEdge:distance:", v13, -a4);
  *(_OWORD *)&a3[1].var0 = v16;
  a3[1].var2 = v17;

}

+ (void)getParameters:(id *)a3 forParallelRotationsWithAngle:(double)a4 threeUpComposition:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  double v17;

  v9 = a5;
  if (objc_msgSend(v9, "numberOfClips") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.numberOfClips == 3"));

  }
  v10 = objc_retainAutorelease(v9);
  v11 = *(_QWORD *)objc_msgSend(v10, "dividerAxes");
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "dividerAxes");

  if (v11 != *(_QWORD *)(v13 + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.dividerAxes[0] == composition.dividerAxes[1]"));

  }
  objc_msgSend(a1, "parametersForRotationWithAngle:", a4);
  *(_OWORD *)&a3[1].var0 = v16;
  a3[1].var2 = v17;
  *(_OWORD *)&a3->var0 = *(_OWORD *)&a3[1].var0;
  a3->var2 = v17;
}

+ (void)getParameters:(id *)a3 forOppositeRotationsWithAngle:(double)a4 threeUpComposition:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  double v17;

  v9 = a5;
  if (objc_msgSend(v9, "numberOfClips") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.numberOfClips == 3"));

  }
  v10 = objc_retainAutorelease(v9);
  v11 = *(_QWORD *)objc_msgSend(v10, "dividerAxes");
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "dividerAxes");

  if (v11 != *(_QWORD *)(v13 + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryClipSeparatorEffect.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition.dividerAxes[0] == composition.dividerAxes[1]"));

  }
  objc_msgSend(a1, "parametersForRotationWithAngle:", a4);
  *(_OWORD *)&a3->var0 = v16;
  a3->var2 = v17;
  objc_msgSend(a1, "parametersForRotationWithAngle:", -a4);
  *(_OWORD *)&a3[1].var0 = v16;
  a3[1].var2 = v17;
}

@end
