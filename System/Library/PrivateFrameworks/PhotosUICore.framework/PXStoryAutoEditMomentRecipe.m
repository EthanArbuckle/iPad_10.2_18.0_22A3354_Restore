@implementation PXStoryAutoEditMomentRecipe

- (PXStoryAutoEditMomentRecipe)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditClip.m"), 417, CFSTR("%s is not available as initializer"), "-[PXStoryAutoEditMomentRecipe init]");

  abort();
}

- (PXStoryAutoEditMomentRecipe)initWithRecipeType:(unint64_t)a3 incomingTransition:(id *)a4 innerTransition:(id *)a5 motion:(id *)a6
{
  PXStoryAutoEditMomentRecipe *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXStoryAutoEditMomentRecipe;
  result = -[PXStoryAutoEditMomentRecipe init](&v14, sel_init);
  if (result)
  {
    result->_recipeType = a3;
    v11 = *(_OWORD *)&a4->var0;
    result->_incomingTransition.settings = ($E27F71463A882F773E6B3BC4CFCF9BBF)a4->var2;
    *(_OWORD *)&result->_incomingTransition.kind = v11;
    v12 = *(_OWORD *)&a5->var0;
    result->_innerTransition.settings = ($E27F71463A882F773E6B3BC4CFCF9BBF)a5->var2;
    *(_OWORD *)&result->_innerTransition.kind = v12;
    v13 = *(_OWORD *)&a6->var0;
    result->_motion.settings.pan.relativeMotion = a6->var1.var0.var1;
    *(_OWORD *)&result->_motion.style = v13;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t recipeType;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  _BYTE v13[32];
  _BYTE v14[32];

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  recipeType = self->_recipeType;
  if (recipeType > 8)
    v6 = CFSTR("??");
  else
    v6 = off_1E511F1F0[recipeType];
  -[PXStoryAutoEditMomentRecipe incomingTransition](self, "incomingTransition");
  PXStoryAutoEditClipTransitionInfoDescription((uint64_t)v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAutoEditMomentRecipe innerTransition](self, "innerTransition");
  PXStoryAutoEditClipTransitionInfoDescription((uint64_t)v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAutoEditMomentRecipe motion](self, "motion");
  PXStoryAutoEditClipMotionInfoDescription(&v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type:%@, incoming:%@, inner:%@, motion:%@"),
    v4,
    self,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)recipeType
{
  return self->_recipeType;
}

- ($CB94F14F4A03AD88347CF1141E14C943)incomingTransition
{
  $68806D11CD65D8BE2A2DEF98801EDCF4 v3;

  v3 = *($68806D11CD65D8BE2A2DEF98801EDCF4 *)((char *)&self[1].var2 + 8);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  retstr->var2 = v3;
  return self;
}

- ($CB94F14F4A03AD88347CF1141E14C943)innerTransition
{
  $68806D11CD65D8BE2A2DEF98801EDCF4 v3;

  v3 = *($68806D11CD65D8BE2A2DEF98801EDCF4 *)((char *)&self[2].var2 + 8);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  retstr->var2 = v3;
  return self;
}

- ($DD059F4CECBB3D9089CC1CCE969C159D)motion
{
  *($6C83F11C3A900281C56806D6FC71BA3F *)retstr = *($6C83F11C3A900281C56806D6FC71BA3F *)(&self->var1.var2 + 1);
  return self;
}

@end
