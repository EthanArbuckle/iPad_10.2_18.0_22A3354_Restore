@implementation _UIDynamicValueAnimation(PhotosUI)

+ (id)pu_dynamicValueAnimationWithInitialValue:()PhotosUI initialVelocity:targetValue:stiffness:dampingFactor:epsilon:
{
  double v11;
  float v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v11 = sqrt(a4);
  UIAnimationDragCoefficient();
  v13 = a4 / (float)(v12 * v12);
  v14 = v12;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4130]), "initWithValue:velocity:unitSize:", a1, a2 / v12, a6);
  objc_msgSend(MEMORY[0x1E0DC4120], "activeValue:ofType:", 0, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addActiveValue:", v16);
  objc_msgSend(v16, "_setBoundaryPull:", v13 * 0.001);
  objc_msgSend(v15, "_setDecelerationFactor:", v11 * -2.0 * a5 / v14 * 0.001 + 1.0);

  return v15;
}

@end
