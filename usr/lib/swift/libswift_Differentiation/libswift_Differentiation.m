uint64_t Differentiable<>.move(by:)()
{
  swift_getAssociatedConformanceWitness();
  return dispatch thunk of static AdditiveArithmetic.+= infix(_:_:)();
}

uint64_t valueWithDifferential<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v8)(char *, uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v8 = *(uint64_t (**)(char *, uint64_t))(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v13 - v9;
  v11 = v8((char *)&v13 - v9, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(a1, v10, a5);
  return v11;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199FFD74](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t valueWithDifferential<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(a4 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v16 - v12;
  v14 = v11((char *)&v16 - v12, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(a1, v13, a7);
  return v14;
}

uint64_t valueWithDifferential<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v13)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;

  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(a5 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v16 = (char *)&v19 - v15;
  v17 = v13((char *)&v19 - v15, a2, a3, a4);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a9 - 8) + 32))(a1, v16, a9);
  return v17;
}

uint64_t valueWithPullback<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v8)(char *, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v8 = *(uint64_t (**)(char *, uint64_t))(a3 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v11 = (char *)&v14 - v10;
  v12 = v8((char *)&v14 - v10, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(a1, v11, a5);
  return v12;
}

uint64_t valueWithPullback<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(a4 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v14 = (char *)&v17 - v13;
  v15 = v11((char *)&v17 - v13, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(a1, v14, a7);
  return v15;
}

uint64_t valueWithPullback<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v13)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;

  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(a5 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v16 = (char *)&v19 - v15;
  v17 = v13((char *)&v19 - v15, a2, a3, a4);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a9 - 8) + 32))(a1, v16, a9);
  return v17;
}

uint64_t differential<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _OWORD *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[3];

  v5 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v8[1];
  v14[0] = *v8;
  v14[1] = v9;
  v14[2] = v8[2];
  v12 = valueWithDifferential<A, B>(at:of:)((uint64_t)v7, v11, (uint64_t)v14, v10, v10);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a4);
  return v12;
}

uint64_t differential<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v18[3];

  v7 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v10[1];
  v18[0] = *v10;
  v18[1] = v11;
  v18[2] = v10[2];
  v16 = valueWithDifferential<A, B, C>(at:_:of:)((uint64_t)v9, v12, v15, (uint64_t)v18, v13, v14, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a6);
  return v16;
}

uint64_t differential<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _OWORD *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v22[3];

  v9 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v12[1];
  v22[0] = *v12;
  v22[1] = v13;
  v22[2] = v12[2];
  v20 = valueWithDifferential<A, B, C, D>(at:_:_:of:)((uint64_t)v11, v14, v15, v19, (uint64_t)v22, v16, v17, v18, v18);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a8);
  return v20;
}

uint64_t pullback<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v6)(char *, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = *(uint64_t (**)(char *, uint64_t))(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v9 = (char *)&v12 - v8;
  v10 = v6((char *)&v12 - v8, a1);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(v9, a4);
  return v10;
}

uint64_t pullback<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(a3 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v12 = (char *)&v15 - v11;
  v13 = v9((char *)&v15 - v11, a1, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(a6 - 8) + 8))(v12, a6);
  return v13;
}

uint64_t pullback<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v12)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(a4 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v15 = (char *)&v18 - v14;
  v16 = v12((char *)&v18 - v14, a1, a2, a3);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(a8 - 8) + 8))(v15, a8);
  return v16;
}

uint64_t derivative<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _OWORD *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *);
  _OWORD v14[3];

  v4 = *(_QWORD *)(a3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v8[1];
  v14[0] = *v8;
  v14[1] = v9;
  v14[2] = v8[2];
  v12 = (void (*)(char *))differential<A, B>(at:of:)(v5, (uint64_t)v14, v10, v11);
  dispatch thunk of FloatingPoint.init(_:)();
  v12(v7);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, a3);
}

uint64_t derivative<A, B, C>(at:_:of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *);
  _QWORD v24[2];
  _OWORD v25[3];

  v24[0] = a4;
  v24[1] = a5;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v8);
  v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v16[1];
  v25[0] = *v16;
  v25[1] = v17;
  v25[2] = v16[2];
  v22 = (void (*)(char *, char *))differential<A, B, C>(at:_:of:)(v13, v18, (uint64_t)v25, v19, v20, v21);
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v22(v15, v10);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, a2);
}

uint64_t derivative<A, B, C, D>(at:_:_:of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, char *);
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[3];

  v35[3] = a5;
  v35[1] = a8;
  v35[2] = a10;
  v35[0] = a6;
  v37 = *(_QWORD *)(a4 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v17);
  v24 = (char *)v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v25[1];
  v38[0] = *v25;
  v38[1] = v26;
  v38[2] = v25[2];
  v33 = (void (*)(char *, char *, char *))differential<A, B, C, D>(at:_:_:of:)(v22, v27, v28, (uint64_t)v38, v29, v30, v31, v32);
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v33(v24, v19, v15);
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, a4);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v19, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v24, a2);
}

uint64_t gradient<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *);
  _OWORD v15[3];

  v5 = *(_QWORD *)(a4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v9[1];
  v15[0] = *v9;
  v15[1] = v10;
  v15[2] = v9[2];
  v13 = (void (*)(char *))pullback<A, B>(at:of:)(v6, (uint64_t)v15, v11, v12);
  dispatch thunk of FloatingPoint.init(_:)();
  v13(v8);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a4);
}

uint64_t gradient<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, char *);
  _OWORD v21[3];

  v11 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v14[1];
  v21[0] = *v14;
  v21[1] = v15;
  v21[2] = v14[2];
  v19 = (void (*)(uint64_t, uint64_t, char *))pullback<A, B, C>(at:_:of:)(v18, v16, (uint64_t)v21, v16, (uint64_t)v14, v17);
  dispatch thunk of FloatingPoint.init(_:)();
  v19(a1, a2, v13);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a8);
}

uint64_t gradient<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, char *);
  _OWORD v24[3];

  v14 = *(_QWORD *)(a11 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = v17[1];
  v24[0] = *v17;
  v24[1] = v18;
  v24[2] = v17[2];
  v22 = (void (*)(uint64_t, uint64_t, uint64_t, char *))pullback<A, B, C, D>(at:_:_:of:)(v21, v19, v20, (uint64_t)v24, v19, v20, (uint64_t)v17, a11);
  dispatch thunk of FloatingPoint.init(_:)();
  v22(a1, a2, a3, v16);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, a11);
}

uint64_t valueWithDerivative<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *);
  _OWORD v16[3];

  v6 = *(_QWORD *)(a5 - 8);
  v7 = MEMORY[0x24BDAC7A8]();
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v10[1];
  v16[0] = *v10;
  v16[1] = v11;
  v16[2] = v10[2];
  v14 = (void (*)(char *))valueWithDifferential<A, B>(at:of:)(v7, v13, (uint64_t)v16, (uint64_t)v10, v12);
  dispatch thunk of FloatingPoint.init(_:)();
  v14(v9);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, a5);
}

uint64_t valueWithDerivative<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _OWORD *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *);
  _QWORD v30[2];
  _OWORD v31[3];

  v30[0] = a11;
  v30[1] = a2;
  v13 = *(_QWORD *)(a7 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1);
  v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v14);
  v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v22[1];
  v31[0] = *v22;
  v31[1] = v23;
  v31[2] = v22[2];
  v28 = (void (*)(char *, char *))valueWithDifferential<A, B, C>(at:_:of:)(v19, v24, v27, (uint64_t)v31, (uint64_t)v22, v25, v26);
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v28(v21, v16);
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, a6);
}

uint64_t valueWithDerivative<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  _OWORD *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, char *);
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD v44[4];

  v40[1] = a13;
  v40[2] = a15;
  v40[0] = a11;
  v17 = *(_QWORD *)(a9 - 8);
  v42 = a2;
  v43 = v17;
  v18 = MEMORY[0x24BDAC7A8](a1);
  v20 = (char *)v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = *(_QWORD *)(v21 - 8);
  v22 = MEMORY[0x24BDAC7A8](v18);
  v24 = (char *)v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v22);
  v29 = (char *)v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v30[1];
  v44[0] = *v30;
  v44[1] = v31;
  v44[2] = v30[2];
  v38 = (void (*)(char *, char *, char *))valueWithDifferential<A, B, C, D>(at:_:_:of:)(v27, v32, v33, v36, (uint64_t)v44, (uint64_t)v30, v34, v35, v37);
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v38(v29, v24, v20);
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v20, a9);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v24, a8);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v29, a7);
}

uint64_t valueWithGradient<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *);
  _OWORD v17[3];

  v7 = *(_QWORD *)(a6 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v11[1];
  v17[0] = *v11;
  v17[1] = v12;
  v17[2] = v11[2];
  v15 = (void (*)(char *))valueWithPullback<A, B>(at:of:)(v8, v14, (uint64_t)v17, (uint64_t)v11, v13);
  dispatch thunk of FloatingPoint.init(_:)();
  v15(v10);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, a6);
}

uint64_t valueWithGradient<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, char *);
  _OWORD v21[3];

  v11 = *(_QWORD *)(a9 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v15[1];
  v21[0] = *v15;
  v21[1] = v16;
  v21[2] = v15[2];
  v19 = (void (*)(uint64_t, uint64_t, char *))valueWithPullback<A, B, C>(at:_:of:)(v12, v18, v17, (uint64_t)v21, v17, (uint64_t)v15, a9);
  dispatch thunk of FloatingPoint.init(_:)();
  v19(a2, a3, v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

uint64_t valueWithGradient<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _OWORD *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, char *);
  _OWORD v26[3];

  v15 = *(_QWORD *)(a12 - 8);
  v16 = MEMORY[0x24BDAC7A8](a1);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = v19[1];
  v26[0] = *v19;
  v26[1] = v20;
  v26[2] = v19[2];
  v24 = (void (*)(uint64_t, uint64_t, uint64_t, char *))valueWithPullback<A, B, C, D>(at:_:_:of:)(v16, v23, v21, v22, (uint64_t)v26, v21, v22, (uint64_t)v19, a12);
  dispatch thunk of FloatingPoint.init(_:)();
  v24(a2, a3, a4, v18);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, a12);
}

uint64_t (*derivative<A, B>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v12 = *a1;
  v13 = a1[5];
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  *(_QWORD *)(v14 + 32) = a4;
  *(_QWORD *)(v14 + 40) = a5;
  *(_QWORD *)(v14 + 48) = a6;
  *(_QWORD *)(v14 + 56) = v12;
  v15 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v14 + 80) = v15;
  *(_QWORD *)(v14 + 96) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in derivative<A, B>(of:);
}

uint64_t partial apply for closure #1 in derivative<A, B>(of:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_OWORD *)(v1 + 72);
  v5[0] = *(_OWORD *)(v1 + 56);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(v1 + 88);
  return derivative<A, B>(at:of:)(a1, (uint64_t)v5, v2);
}

uint64_t (*derivative<A, B, C>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = *a1;
  v16 = a1[5];
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  *(_QWORD *)(v17 + 32) = a4;
  *(_QWORD *)(v17 + 40) = a5;
  *(_QWORD *)(v17 + 48) = a6;
  *(_QWORD *)(v17 + 56) = a7;
  *(_QWORD *)(v17 + 64) = a8;
  *(_QWORD *)(v17 + 72) = a9;
  *(_QWORD *)(v17 + 80) = v15;
  *(_OWORD *)(v17 + 88) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v17 + 104) = *(_OWORD *)(a1 + 3);
  *(_QWORD *)(v17 + 120) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in derivative<A, B, C>(of:);
}

uint64_t sub_216C698E8()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in derivative<A, B, C>(of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return derivative<A, B, C>(at:_:of:)(a1, v2[2], v2[3], v2[5], a2);
}

uint64_t (*derivative<A, B, C, D>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  v16 = *a1;
  v17 = a1[5];
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = a3;
  *(_QWORD *)(v18 + 32) = a4;
  *(_QWORD *)(v18 + 40) = a5;
  *(_QWORD *)(v18 + 48) = a6;
  *(_QWORD *)(v18 + 56) = a7;
  *(_QWORD *)(v18 + 64) = a8;
  *(_OWORD *)(v18 + 72) = a9;
  *(_QWORD *)(v18 + 88) = a10;
  *(_QWORD *)(v18 + 96) = a11;
  *(_QWORD *)(v18 + 104) = v16;
  v19 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v18 + 112) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v18 + 128) = v19;
  *(_QWORD *)(v18 + 144) = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in derivative<A, B, C, D>(of:);
}

uint64_t sub_216C69A50()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in derivative<A, B, C, D>(of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  return derivative<A, B, C, D>(at:_:_:of:)(a1, v2[2], v2[3], v2[4], a2, v2[6], v4, v2[8], v5, v2[10]);
}

uint64_t (*gradient<A, B>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v12 = *a1;
  v13 = a1[5];
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  *(_QWORD *)(v14 + 32) = a4;
  *(_QWORD *)(v14 + 40) = a5;
  *(_QWORD *)(v14 + 48) = a6;
  *(_QWORD *)(v14 + 56) = v12;
  v15 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v14 + 80) = v15;
  *(_QWORD *)(v14 + 96) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in gradient<A, B>(of:);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in gradient<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_OWORD *)(v3 + 72);
  v7[0] = *(_OWORD *)(v3 + 56);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(v3 + 88);
  return gradient<A, B>(at:of:)(a1, (uint64_t)v7, a3, v4);
}

uint64_t (*gradient<A, B, C>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v15 = *a1;
  v16 = a1[5];
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  *(_QWORD *)(v17 + 32) = a4;
  *(_QWORD *)(v17 + 40) = a5;
  *(_QWORD *)(v17 + 48) = a6;
  *(_QWORD *)(v17 + 56) = a7;
  *(_QWORD *)(v17 + 64) = a8;
  *(_QWORD *)(v17 + 72) = v15;
  v18 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v17 + 96) = v18;
  *(_QWORD *)(v17 + 112) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in gradient<A, B, C>(of:);
}

uint64_t sub_216C69CE4()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in gradient<A, B, C>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v11[3];

  v8 = *(_QWORD *)(v7 + 32);
  v9 = *(_OWORD *)(v7 + 88);
  v11[0] = *(_OWORD *)(v7 + 72);
  v11[1] = v9;
  v11[2] = *(_OWORD *)(v7 + 104);
  return gradient<A, B, C>(at:_:of:)(a1, a2, a3, a4, (uint64_t)v11, a6, a7, v8);
}

uint64_t (*gradient<A, B, C, D>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v15 = *a1;
  v16 = a1[5];
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  *(_QWORD *)(v17 + 32) = a4;
  *(_QWORD *)(v17 + 40) = a5;
  *(_QWORD *)(v17 + 48) = a6;
  *(_QWORD *)(v17 + 56) = a7;
  *(_QWORD *)(v17 + 64) = a8;
  *(_QWORD *)(v17 + 72) = a9;
  *(_QWORD *)(v17 + 80) = a10;
  *(_QWORD *)(v17 + 88) = v15;
  v18 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v17 + 96) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v17 + 112) = v18;
  *(_QWORD *)(v17 + 128) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in gradient<A, B, C, D>(of:);
}

uint64_t sub_216C69E38()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in gradient<A, B, C, D>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[3];

  v9 = *(_QWORD *)(v8 + 40);
  v10 = *(_OWORD *)(v8 + 104);
  v14[0] = *(_OWORD *)(v8 + 88);
  v14[1] = v10;
  v14[2] = *(_OWORD *)(v8 + 120);
  return gradient<A, B, C, D>(at:_:_:of:)(a1, a2, a3, a4, a5, a6, (uint64_t)v14, a8, v12, v13, v9);
}

uint64_t withoutDerivative<A>(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

void _fatalErrorForwardModeDifferentiationDisabled()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t _ConcreteDifferentiableBox._move(by:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];

  v3 = *(_QWORD *)(a2 + 24);
  v21 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v20 = type metadata accessor for Optional();
  v5 = *(_QWORD *)(v20 - 8);
  v6 = MEMORY[0x24BDAC7A8](v20);
  v8 = (char *)&v19 - v7;
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v19 - v10;
  v13 = a1[3];
  v12 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v13);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v12 + 56))(v22, v13, v12);
  v14 = swift_dynamicCast();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (!v14)
  {
    v15(v8, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v20);
    v17 = a1[3];
    v18 = a1[4];
    __swift_project_boxed_opaque_existential_1Tm(a1, v17);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v18 + 56))(v22, v17, v18);
    __swift_project_boxed_opaque_existential_1Tm(v22, v22[3]);
    swift_getDynamicType();
    _derivativeTypeMismatch(_:_:file:line:)();
  }
  v15(v8, 0, 1, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v8, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v11, v21, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
}

uint64_t AnyDerivative.base.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 56))(v1, v2);
}

void _derivativeTypeMismatch(_:_:file:line:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(35);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any.Type);
  v0._countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 0x20646E6120;
  v1._object = (void *)0xE500000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199FFD68]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t protocol witness for _AnyDifferentiableBox._typeErasedBase.getter in conformance _ConcreteDifferentiableBox<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return _ConcreteDifferentiableBox._typeErasedBase.getter(a1, a2);
}

uint64_t AnyDifferentiable.base.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t AnyDifferentiable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return AnyDifferentiable.init<A>(_:)(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for _ConcreteDifferentiableBox, (uint64_t)&protocol witness table for _ConcreteDifferentiableBox<A>, a3);
}

uint64_t type metadata accessor for _ConcreteDifferentiableBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ConcreteDifferentiableBox);
}

uint64_t (*static AnyDifferentiable._vjpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(_QWORD *a1)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  a1[3] = type metadata accessor for _ConcreteDifferentiableBox(0, a3, a4, v10);
  a1[4] = (uint64_t)&protocol witness table for _ConcreteDifferentiableBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a1);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1Tm, v9, a3);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  return partial apply for closure #1 in static AnyDifferentiable._vjpInit<A>(_:);
}

uint64_t closure #1 in static AnyDifferentiable._vjpInit<A>(_:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v1 = a1[3];
  v2 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  swift_getAssociatedTypeWitness();
  return swift_dynamicCast();
}

uint64_t sub_216C6A494()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static AnyDifferentiable._vjpInit<A>(_:)(_QWORD *a1)
{
  return closure #1 in static AnyDifferentiable._vjpInit<A>(_:)(a1);
}

uint64_t (*reverse-mode derivative of AnyDifferentiable.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(_QWORD *a1)
{
  static AnyDifferentiable._vjpInit<A>(_:)(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
  return partial apply for closure #1 in static AnyDifferentiable._vjpInit<A>(_:);
}

uint64_t (*static AnyDifferentiable._jvpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  a1[3] = type metadata accessor for _ConcreteDifferentiableBox(0, a3, a4, v10);
  a1[4] = (uint64_t)&protocol witness table for _ConcreteDifferentiableBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a1);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1Tm, v9, a3);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  return partial apply for closure #1 in static AnyDifferentiable._jvpInit<A>(_:);
}

uint64_t closure #1 in static AnyDifferentiable._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v12 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v12 - v6, a1, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  a2[3] = type metadata accessor for _ConcreteDerivativeBox(0, AssociatedTypeWitness, AssociatedConformanceWitness, v9);
  a2[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a2);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v5 + 32))(boxed_opaque_existential_1Tm, v7, AssociatedTypeWitness);
}

uint64_t sub_216C6A6BC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static AnyDifferentiable._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in static AnyDifferentiable._jvpInit<A>(_:)(a1, a2);
}

uint64_t AnyDerivative.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return AnyDifferentiable.init<A>(_:)(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for _ConcreteDerivativeBox, (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>, a3);
}

uint64_t AnyDifferentiable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t *boxed_opaque_existential_1Tm;

  a5[3] = a3(0);
  a5[4] = a4;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a5);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(boxed_opaque_existential_1Tm, a1, a2);
}

uint64_t (*forward-mode derivative of AnyDifferentiable.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  static AnyDifferentiable._jvpInit<A>(_:)(a1, a2, a3, a4);
  v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for closure #1 in static AnyDifferentiable._jvpInit<A>(_:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@out AnyDerivative);
}

uint64_t AnyDifferentiable.move(by:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

uint64_t protocol witness for Differentiable.move(by:) in conformance AnyDifferentiable(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

uint64_t AnyDifferentiable.customMirror.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 16))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance AnyDifferentiable()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 16))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

Swift::Bool __swiftcall _AnyDerivativeBox._isOpaqueZero()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v5;
  uint64_t v7;

  v2 = v1;
  v3 = v0;
  v4 = *(void (**)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v1 + 64);
  v5 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  v4(&v7, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v5, v3, v2);
  return (v7 & 1) == 0;
}

uint64_t _ConcreteDerivativeBox._base.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t _ConcreteDerivativeBox._base.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2, a1);
}

uint64_t (*_ConcreteDerivativeBox._base.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t _ConcreteDerivativeBox.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t type metadata accessor for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ConcreteDerivativeBox);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@out AnyDerivative)(uint64_t a1)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  (*(void (**)(void))(v1 + 32))();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero;
  if (!lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero)
  {
    result = MEMORY[0x2199FFD80](&protocol conformance descriptor for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero;
  if (!lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero)
  {
    result = MEMORY[0x2199FFD80](&protocol conformance descriptor for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero;
  if (!lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero)
  {
    result = MEMORY[0x2199FFD80](&protocol conformance descriptor for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero);
  }
  return result;
}

uint64_t _ConcreteDifferentiableBox._typeErasedBase.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1Tm;

  v3 = *(_QWORD *)(a1 + 16);
  a2[3] = v3;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1Tm, v2, v3);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t _ConcreteDerivativeBox._unboxed<A>(to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v5 = v4;
  v9 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for _ConcreteDerivativeBox(255, v12, v13, v13);
  v15 = type metadata accessor for Optional();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v25 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v5, a2);
  v19 = swift_dynamicCast();
  v20 = *(_QWORD *)(v14 - 8);
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  if (v19)
  {
    v21(v18, 0, 1, v14);
    v22 = *(_QWORD *)(a3 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(a4, v18, a3);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v14);
    v23 = 0;
  }
  else
  {
    v23 = 1;
    v21(v18, 1, 1, v14);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    v22 = *(_QWORD *)(a3 - 8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(a4, v23, 1, a3);
}

uint64_t _ConcreteDerivativeBox._isEqual(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  char v27;
  uint64_t v28;
  char *v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;

  v3 = v2;
  v37 = a2;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v34 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Optional();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v38 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v10 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v36 = (char *)&v33 - v11;
  v12 = *(_QWORD *)(v8 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v35 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v33 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v33 - v18, v3, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  v20 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  v21 = *(void (**)(uint64_t, uint64_t))(v20 + 64);
  v33 = *(_QWORD *)(v37 + 24);
  v22 = v12;
  v23 = v36;
  v21(v5, v5);
  v37 = TupleTypeMetadata2;
  v24 = &v23[*(int *)(TupleTypeMetadata2 + 48)];
  v25 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v25(v23, v19, v8);
  v25(v24, v17, v8);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (v26(v23, 1, v5) == 1)
  {
    if (v26(v24, 1, v5) == 1)
    {
      v27 = 1;
    }
    else
    {
      v22 = v38;
      v8 = v37;
      v27 = 0;
    }
  }
  else
  {
    v28 = v38;
    v29 = v35;
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v35, v23, v8);
    if (v26(v24, 1, v5) == 1)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v29, v5);
      v27 = 0;
      v22 = v28;
      v8 = v37;
    }
    else
    {
      v30 = v34;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v34, v24, v5);
      swift_getAssociatedConformanceWitness();
      v27 = dispatch thunk of static Equatable.== infix(_:_:)();
      v31 = *(void (**)(char *, uint64_t))(v6 + 8);
      v31(v30, v5);
      v31(v29, v5);
    }
  }
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v8);
  return v27 & 1;
}

uint64_t _ConcreteDerivativeBox._isNotEqual(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  char v27;
  char *v28;
  char *v29;
  char v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;

  v3 = v2;
  v38 = a2;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v34 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Optional();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v36 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v10 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v37 = (char *)&v33 - v11;
  v12 = *(_QWORD *)(v8 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v35 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v33 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v33 - v18, v3, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  v20 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  v21 = *(void (**)(uint64_t, uint64_t))(v20 + 64);
  v33 = *(_QWORD *)(v38 + 24);
  v22 = v12;
  v23 = v37;
  v21(v5, v5);
  v38 = TupleTypeMetadata2;
  v24 = &v23[*(int *)(TupleTypeMetadata2 + 48)];
  v25 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v25(v23, v19, v8);
  v25(v24, v17, v8);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (v26(v23, 1, v5) != 1)
  {
    v28 = v35;
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v35, v23, v8);
    if (v26(v24, 1, v5) != 1)
    {
      v29 = v34;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v34, v24, v5);
      swift_getAssociatedConformanceWitness();
      v30 = dispatch thunk of static Equatable.== infix(_:_:)();
      v31 = *(void (**)(char *, uint64_t))(v6 + 8);
      v31(v29, v5);
      v31(v28, v5);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v8);
      v27 = v30 ^ 1;
      return v27 & 1;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v28, v5);
    goto LABEL_6;
  }
  if (v26(v24, 1, v5) != 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v36 + 8))(v23, v38);
    v27 = 1;
    return v27 & 1;
  }
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v8);
  v27 = 0;
  return v27 & 1;
}

uint64_t static _ConcreteDerivativeBox._zero.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v12;

  v6 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  a3[3] = type metadata accessor for _ConcreteDerivativeBox(0, a1, a2, v9);
  a3[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a3);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v6 + 32))(boxed_opaque_existential_1Tm, v8, a1);
}

uint64_t _ConcreteDerivativeBox._adding(_:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t AssociatedConformanceWitness;
  char *v27;
  uint64_t *v28;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];

  v7 = *(_QWORD *)(a2 + 16);
  v8 = type metadata accessor for Optional();
  v39 = *(_QWORD *)(v8 - 8);
  v40 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - v10;
  v12 = *(_QWORD *)(v7 - 8);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v35 - v16;
  v18 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  _ConcreteDerivativeBox._unboxed<A>(to:)(v18, a2, (uint64_t)&type metadata for AnyDerivative.OpaqueZero, (uint64_t)v41);
  if ((v41[0] & 1) == 0)
    return outlined init with copy of _AnyDerivativeBox((uint64_t)a1, a3);
  v36 = v15;
  v37 = (uint64_t *)a3;
  v38 = v3;
  v20 = a1[3];
  v19 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v20);
  (*(void (**)(_QWORD *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v19 + 64))(v41, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v18, v20, v19);
  if ((v41[0] & 1) != 0)
  {
    v21 = a1[3];
    v22 = a1[4];
    __swift_project_boxed_opaque_existential_1Tm(a1, v21);
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v22 + 64))(v7, v7, *(_QWORD *)(a2 + 24), v21, v22);
    v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v7);
    v24 = v38;
    if (v23 == 1)
    {
      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v40);
      v33 = a1[3];
      v34 = a1[4];
      __swift_project_boxed_opaque_existential_1Tm(a1, v33);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v34 + 56))(v41, v33, v34);
      __swift_project_boxed_opaque_existential_1Tm(v41, v41[3]);
      swift_getDynamicType();
      _derivativeTypeMismatch(_:_:file:line:)();
    }
    v25 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v25(v17, v11, v7);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v27 = v36;
    MEMORY[0x2199FF9FC](v24, v17, v7, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v7);
    v28 = v37;
    v37[3] = a2;
    v28[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v28);
    return ((uint64_t (*)(uint64_t *, char *, uint64_t))v25)(boxed_opaque_existential_1Tm, v27, v7);
  }
  else
  {
    v31 = v37;
    v37[3] = a2;
    v31[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
    v32 = __swift_allocate_boxed_opaque_existential_1Tm(v31);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(v32, v38, a2);
  }
}

_QWORD *__swift_project_boxed_opaque_existential_1Tm(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of _AnyDerivativeBox(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t _ConcreteDerivativeBox._subtracting(_:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *(*v16)(_QWORD *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  char *v27;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;

  v7 = *(_QWORD *)(a2 + 16);
  v8 = type metadata accessor for Optional();
  v36 = *(_QWORD *)(v8 - 8);
  v37 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v40 = (char *)&v35 - v10;
  v41 = *(_QWORD *)(v7 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v38 = (char *)&v35 - v13;
  v15 = a1[3];
  v14 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v15);
  v16 = *(_QWORD *(**)(_QWORD *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v14 + 64);
  v17 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  v18 = v16(v42, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v17, v15, v14);
  if ((v42[0] & 1) != 0)
  {
    v19 = a3;
    _ConcreteDerivativeBox._unboxed<A>(to:)((uint64_t)v18, a2, (uint64_t)&type metadata for AnyDerivative.OpaqueZero, (uint64_t)v42);
    v20 = a1[3];
    if ((v42[0] & 1) != 0)
    {
      v35 = v3;
      v21 = a1[4];
      __swift_project_boxed_opaque_existential_1Tm(a1, v20);
      v22 = v40;
      (*(void (**)(uint64_t, uint64_t))(v21 + 64))(v7, v7);
      v23 = v41;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v22, 1, v7) == 1)
      {
        (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v37);
        v33 = a1[3];
        v34 = a1[4];
        __swift_project_boxed_opaque_existential_1Tm(a1, v33);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v34 + 56))(v42, v33, v34);
        __swift_project_boxed_opaque_existential_1Tm(v42, v43);
        swift_getDynamicType();
        _derivativeTypeMismatch(_:_:file:line:)();
      }
      v24 = v19;
      v25 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
      v26 = v38;
      v25(v38, v22, v7);
      swift_getAssociatedConformanceWitness();
      v27 = v39;
      dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v7);
      v24[3] = a2;
      v24[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
      boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v24);
      return ((uint64_t (*)(uint64_t *, char *, uint64_t))v25)(boxed_opaque_existential_1Tm, v27, v7);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
      swift_getDynamicType();
      (*(void (**)(_QWORD *__return_ptr))(a1[4] + 24))(v42);
      v31 = v43;
      v32 = v44;
      __swift_project_boxed_opaque_existential_1Tm(v42, v43);
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(v32 + 40))(a1, v31, v32);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    }
  }
  else
  {
    a3[3] = a2;
    a3[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
    v30 = __swift_allocate_boxed_opaque_existential_1Tm(a3);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(v30, v3, a2);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *_ConcreteDerivativeBox._move(by:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *(*v14)(_QWORD *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v15;
  _QWORD *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];

  v4 = *(_QWORD *)(a2 + 16);
  v5 = type metadata accessor for Optional();
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - v7;
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v12);
  v14 = *(_QWORD *(**)(_QWORD *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v13 + 64);
  v15 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  result = v14(v25, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v15, v12, v13);
  if (LOBYTE(v25[0]) == 1)
  {
    v17 = a1[3];
    v18 = a1[4];
    __swift_project_boxed_opaque_existential_1Tm(a1, v17);
    v19 = *(_QWORD *)(a2 + 24);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 64))(v4, v4, v19, v17, v18);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v4) == 1)
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
      v20 = a1[3];
      v21 = a1[4];
      __swift_project_boxed_opaque_existential_1Tm(a1, v20);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 56))(v25, v20, v21);
      __swift_project_boxed_opaque_existential_1Tm(v25, v25[3]);
      swift_getDynamicType();
      _derivativeTypeMismatch(_:_:file:line:)();
    }
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v8, v4);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v11, v4, v19);
    return (_QWORD *)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v4);
  }
  return result;
}

uint64_t protocol witness for static _AnyDerivativeBox._zero.getter in conformance _ConcreteDerivativeBox<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return static _ConcreteDerivativeBox._zero.getter(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
}

uint64_t protocol witness for _AnyDerivativeBox._unboxed<A>(to:) in conformance _ConcreteDerivativeBox<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return _ConcreteDerivativeBox._unboxed<A>(to:)(a1, a3, a2, a4);
}

uint64_t AnyDerivative._box.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of _AnyDerivativeBox(v1, a1);
}

uint64_t AnyDerivative._box.setter(__int128 *a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v1);
  return outlined init with take of _AnyDerivativeBox(a1, v1);
}

uint64_t outlined init with take of _AnyDerivativeBox(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*AnyDerivative._box.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t AnyDerivative.init(_box:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return outlined init with take of _AnyDerivativeBox(a1, a2);
}

uint64_t (*static AnyDerivative._vjpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(_QWORD *a1)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  a1[3] = type metadata accessor for _ConcreteDerivativeBox(0, a3, a4, v10);
  a1[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a1);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1Tm, v9, a3);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  return partial apply for closure #1 in static AnyDerivative._vjpInit<A>(_:);
}

uint64_t closure #1 in static AnyDerivative._vjpInit<A>(_:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v1 = a1[3];
  v2 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  return swift_dynamicCast();
}

uint64_t sub_216C6BDFC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static AnyDerivative._vjpInit<A>(_:)(_QWORD *a1)
{
  return closure #1 in static AnyDerivative._vjpInit<A>(_:)(a1);
}

uint64_t (*reverse-mode derivative of AnyDerivative.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(_QWORD *a1)
{
  static AnyDerivative._vjpInit<A>(_:)(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
  return partial apply for closure #1 in static AnyDerivative._vjpInit<A>(_:);
}

uint64_t (*static AnyDerivative._jvpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  a1[3] = type metadata accessor for _ConcreteDerivativeBox(0, a3, a4, v10);
  a1[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a1);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1Tm, v9, a3);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  return partial apply for closure #1 in static AnyDerivative._jvpInit<A>(_:);
}

uint64_t closure #1 in static AnyDerivative._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  a4[3] = type metadata accessor for _ConcreteDerivativeBox(0, a2, a3, v10);
  a4[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a4);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1Tm, v9, a2);
}

uint64_t sub_216C6BFD8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static AnyDerivative._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in static AnyDerivative._jvpInit<A>(_:)(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t (*forward-mode derivative of AnyDerivative.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  static AnyDerivative._jvpInit<A>(_:)(a1, a2, a3, a4);
  v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for closure #1 in static AnyDerivative._jvpInit<A>(_:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out AnyDerivative);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out AnyDerivative)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  (*(void (**)(void))(v1 + 32))();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

uint64_t static AnyDerivative.== infix(_:_:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a2, v3, v4) & 1;
}

uint64_t static AnyDerivative.!= infix(_:_:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, v3, v4) & 1;
}

uint64_t static AnyDerivative.OpaqueZero.== infix(_:_:)()
{
  return 1;
}

uint64_t static AdditiveArithmetic.+= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(uint64_t);
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v8, a3);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AnyDerivative.OpaqueZero()
{
  return 1;
}

uint64_t static AnyDerivative.zero.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConcreteDerivativeBox<AnyDerivative.OpaqueZero>);
  *(_QWORD *)(a1 + 24) = result;
  *(_QWORD *)(a1 + 32) = &protocol witness table for _ConcreteDerivativeBox<A>;
  return result;
}

uint64_t static AnyDerivative.+ infix(_:_:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a2, v3, v4);
}

uint64_t (*static AnyDerivative._vjpAdd(lhs:rhs:)(uint64_t a1, _QWORD *a2, uint64_t a3))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpAdd(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined init with copy of AnyDerivative(a3, a1);
  return outlined init with copy of AnyDerivative(a3, a2);
}

uint64_t (*reverse-mode derivative of static AnyDerivative.+ infix(_:_:)(uint64_t a1, _QWORD *a2, uint64_t a3))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpAdd(lhs:rhs:);
}

uint64_t (*static AnyDerivative._jvpAdd(lhs:rhs:)(uint64_t a1, _QWORD *a2, uint64_t a3))(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpAdd(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._jvpAdd(lhs:rhs:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a2, v3, v4);
}

uint64_t (*forward-mode derivative of static AnyDerivative.+ infix(_:_:)(uint64_t a1, _QWORD *a2, uint64_t a3))(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpAdd(lhs:rhs:);
}

uint64_t static AnyDerivative.- infix(_:_:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(a2, v3, v4);
}

uint64_t (*static AnyDerivative._vjpSubtract(lhs:rhs:)(uint64_t a1, _QWORD *a2, uint64_t a3))(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpSubtract(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;
  _QWORD v7[5];

  outlined init with copy of AnyDerivative((uint64_t)a3, a1);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConcreteDerivativeBox<AnyDerivative.OpaqueZero>);
  v7[3] = v5;
  v7[4] = &protocol witness table for _ConcreteDerivativeBox<A>;
  __swift_project_boxed_opaque_existential_1Tm(v7, v5);
  _ConcreteDerivativeBox._subtracting(_:)(a3, v5, a2);
  return outlined destroy of AnyDerivative((uint64_t)v7);
}

uint64_t (*reverse-mode derivative of static AnyDerivative.- infix(_:_:)(uint64_t a1, _QWORD *a2, uint64_t a3))(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpSubtract(lhs:rhs:);
}

uint64_t (*static AnyDerivative._jvpSubtract(lhs:rhs:)(uint64_t a1, _QWORD *a2, uint64_t a3))(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpSubtract(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._jvpSubtract(lhs:rhs:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(a2, v3, v4);
}

uint64_t (*forward-mode derivative of static AnyDerivative.- infix(_:_:)(uint64_t a1, _QWORD *a2, uint64_t a3))(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpSubtract(lhs:rhs:);
}

uint64_t *AnyDerivative.move(by:)(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1Tm(v1, v3);
  v5 = *(void (**)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v4 + 64);
  v6 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  v5(&v10, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v6, v3, v4);
  if ((v10 & 1) == 0)
    return __swift_assign_boxed_opaque_existential_1(v1, a1);
  v7 = v1[3];
  v8 = v1[4];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v1, v7);
  return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a1, v7, v8);
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t *protocol witness for Differentiable.move(by:) in conformance AnyDerivative(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v4;
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1Tm(v1, v1[3]);
  if (_AnyDerivativeBox._isOpaqueZero()())
    return __swift_assign_boxed_opaque_existential_1(v1, a1);
  v4 = v1[3];
  v5 = v1[4];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v1, v4);
  return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v5 + 48))(a1, v4, v5);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance AnyDerivative@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConcreteDerivativeBox<AnyDerivative.OpaqueZero>);
  *(_QWORD *)(a1 + 24) = result;
  *(_QWORD *)(a1 + 32) = &protocol witness table for _ConcreteDerivativeBox<A>;
  return result;
}

double protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance AnyDerivative(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  __int128 v7;
  _OWORD v8[2];
  uint64_t v9;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)a1, v4);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(v5 + 32))(v8, a2, v4, v5);
  outlined destroy of AnyDerivative(a1);
  result = *(double *)v8;
  v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 32) = v9;
  return result;
}

double protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance AnyDerivative(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  __int128 v7;
  _OWORD v8[2];
  uint64_t v9;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)a1, v4);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(v5 + 40))(v8, a2, v4, v5);
  outlined destroy of AnyDerivative(a1);
  result = *(double *)v8;
  v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 32) = v9;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AnyDerivative(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a2, v3, v4) & 1;
}

uint64_t AnyDerivative.customMirror.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance AnyDerivative()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

uint64_t Array<A>.DifferentiableView.base.getter()
{
  _ConcreteDerivativeBox._base.modify();
  return swift_bridgeObjectRetain();
}

uint64_t key path getter for Array<A>.DifferentiableView.base : <A>[A]<A>.DifferentiableView@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = _ConcreteDerivativeBox._base.modify(*a1, *(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 8));
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for Array<A>.DifferentiableView.base : <A>[A]<A>.DifferentiableView(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)();
  _QWORD *v3;
  uint64_t v5;

  v1 = *a1;
  swift_bridgeObjectRetain();
  v2 = Array<A>.DifferentiableView.base.modify();
  *v3 = v1;
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t *, _QWORD))v2)(&v5, 0);
}

uint64_t (*Array<A>.DifferentiableView.base.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t Array<A>.DifferentiableView.base.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t Array<A>.DifferentiableView._vjpBase()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t reverse-mode derivative of Array<A>.DifferentiableView.base.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = Array<A>.DifferentiableView._vjpBase()(a1, a2, a3);
  v7 = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._vjpBase();
  v8[5] = v7;
  return v5;
}

uint64_t Array<A>.DifferentiableView._jvpBase()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t forward-mode derivative of Array<A>.DifferentiableView.base.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = Array<A>.DifferentiableView._jvpBase()(a1, a2, a3);
  v7 = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._jvpBase();
  v8[5] = v7;
  return v5;
}

uint64_t static Array<A>.DifferentiableView._vjpInit(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t reverse-mode derivative of Array<A>.DifferentiableView.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = static Array<A>.DifferentiableView._vjpInit(_:)(a1, a2, a3);
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._vjpBase();
  v8[5] = v7;
  return v5;
}

uint64_t static Array<A>.DifferentiableView._jvpInit(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t forward-mode derivative of Array<A>.DifferentiableView.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = static Array<A>.DifferentiableView._jvpInit(_:)(a1, a2, a3);
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._vjpBase();
  v8[5] = v7;
  return v5;
}

uint64_t Array<A>.DifferentiableView.move(by:)(int64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  int64_t v14;
  int64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v24 - v6;
  v28 = a1;
  v8 = type metadata accessor for Array();
  v26 = a1;
  swift_bridgeObjectRetain();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12E0], v8);
  if ((Collection.isEmpty.getter() & 1) != 0)
    return swift_bridgeObjectRelease();
  v9 = swift_bridgeObjectRetain();
  v10 = MEMORY[0x2199FF81C](v9, v3);
  swift_bridgeObjectRelease();
  v11 = v26;
  v12 = MEMORY[0x2199FF81C](v26, AssociatedTypeWitness);
  if (v10 == v12)
  {
    v27 = v11;
    MEMORY[0x2199FFD80](MEMORY[0x24BEE12D8], v8);
    RandomAccessCollection<>.indices.getter();
    v13 = v28;
    v14 = v29;
    if (v28 != v29)
    {
      if (v29 <= v28)
        v15 = v28;
      else
        v15 = v29;
      while (v15 != v13)
      {
        Array.subscript.getter();
        type metadata accessor for Array();
        Array._makeMutableAndUnique()();
        Array._checkSubscript_mutating(_:)(v13);
        _swift_isClassOrObjCExistentialType();
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v7, v3, v4);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v7, AssociatedTypeWitness);
        if (v14 == ++v13)
          return swift_bridgeObjectRelease();
      }
      v12 = _fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
      goto LABEL_11;
    }
    return swift_bridgeObjectRelease();
  }
LABEL_11:
  v17 = v12;
  swift_bridgeObjectRelease();
  v28 = 0;
  v29 = 0xE000000000000000;
  _StringGuts.grow(_:)(48);
  swift_bridgeObjectRelease();
  v28 = 0xD000000000000010;
  v29 = 0x8000000216C959B0;
  v18 = swift_bridgeObjectRetain();
  v19 = MEMORY[0x2199FF81C](v18, v3);
  swift_bridgeObjectRelease();
  v27 = v19;
  v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 0x27666C6573272820;
  v21._object = (void *)0xEE0020646E612029;
  String.append(_:)(v21);
  v27 = v17;
  v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = 0x6365726964272820;
  v23._object = (void *)0xEE0029276E6F6974;
  String.append(_:)(v23);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for Differentiable.move(by:) in conformance [A]<A>.DifferentiableView(int64_t *a1, uint64_t a2)
{
  return Array<A>.DifferentiableView.move(by:)(*a1, a2);
}

uint64_t static Array<A>.DifferentiableView<>.== infix(_:_:)()
{
  char v0;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = static Array<A>.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> [A]<A>.DifferentiableView()
{
  return static Array<A>.DifferentiableView<>.== infix(_:_:)();
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance [A]<A>.DifferentiableView@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t Array<A>.DifferentiableView.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_bridgeObjectRetain();
  v4 = MEMORY[0x2199FF7B0](v3, a2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance [A]<A>.DifferentiableView(uint64_t a1)
{
  uint64_t *v1;

  return Array<A>.DifferentiableView.description.getter(*v1, *(_QWORD *)(a1 + 16));
}

uint64_t Array<A>.DifferentiableView.customMirror.getter()
{
  swift_bridgeObjectRetain();
  Array.customMirror.getter();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance [A]<A>.DifferentiableView()
{
  return Array<A>.DifferentiableView.customMirror.getter();
}

uint64_t static Array<A>.DifferentiableView<>.zero.getter()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  return static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, a3, a4, a5, 140, (uint64_t)&unk_24D6075C8, (uint64_t)partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:), (void (*)(char *, char *))partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A));
}

uint64_t _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t AssociatedTypeWitness;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  Swift::Int v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *);
  uint64_t v58;
  char *v59;
  uint64_t v60;

  v43 = a8;
  v44 = a5;
  v9 = v8;
  v58 = a2;
  v59 = a4;
  v57 = a1;
  v42 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v55 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v54 = (char *)&v39 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v14);
  v41 = (char *)&v39 - v15;
  v49 = v16;
  v18 = v17;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v20 = type metadata accessor for Optional();
  v45 = *(_QWORD *)(v20 - 8);
  v46 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v47 = (char *)&v39 - v25;
  v26 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v27 = MEMORY[0x24BDAC7A8](v24);
  v40 = (char *)&v39 - v28;
  v53 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v50 = (char *)&v39 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = swift_getAssociatedTypeWitness();
  v31 = *(_QWORD *)(v30 - 8);
  v51 = v30;
  v52 = v31;
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v39 - v32;
  v34 = dispatch thunk of Sequence.underestimatedCount.getter();
  v60 = MEMORY[0x2199FF9CC](v59);
  v56 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v34);
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v50, v48, v18);
  v59 = v33;
  dispatch thunk of Sequence.makeIterator()();
  if (v34 < 0)
  {
    while (1)
    {
LABEL_13:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  v35 = v51;
  swift_getAssociatedConformanceWitness();
  if (v34)
  {
    while (1)
    {
      dispatch thunk of IteratorProtocol.next()();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v23, 1, AssociatedTypeWitness) == 1)
        goto LABEL_13;
      v57(v23, v55);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v23, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      if (!--v34)
        goto LABEL_6;
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v59, v35);
    swift_release();
    (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v23, AssociatedTypeWitness);
  }
  else
  {
LABEL_6:
    v36 = v47;
    dispatch thunk of IteratorProtocol.next()();
    v55 = *(char **)(v26 + 48);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
    {
LABEL_10:
      (*(void (**)(char *, uint64_t))(v52 + 8))(v59, v35);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v36, v46);
      return v60;
    }
    else
    {
      v53 = *(_QWORD *)(v26 + 32);
      v37 = v40;
      while (1)
      {
        ((void (*)(char *, char *, uint64_t))v53)(v37, v36, AssociatedTypeWitness);
        v57(v37, v54);
        if (v9)
          break;
        v9 = 0;
        (*(void (**)(char *, uint64_t))(v26 + 8))(v37, AssociatedTypeWitness);
        ContiguousArray.append(_:)();
        dispatch thunk of IteratorProtocol.next()();
        if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
          goto LABEL_10;
      }
      (*(void (**)(char *, uint64_t))(v26 + 8))(v37, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v59, v35);
      swift_release();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v54, v44);
    }
  }
}

uint64_t static Array<A>.DifferentiableView<>.- infix(_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  return static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, a3, a4, a5, 156, (uint64_t)&unk_24D6075F0, (uint64_t)partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.- infix(_:_:), (void (*)(char *, char *))partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A));
}

uint64_t static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(char *, char *))
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  _QWORD v30[7];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;

  v15 = swift_bridgeObjectRetain();
  v16 = MEMORY[0x2199FF81C](v15, a3);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return a2;
  }
  v17 = v16;
  v18 = swift_bridgeObjectRetain();
  v19 = MEMORY[0x2199FF81C](v18, a3);
  if (!v19)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (v17 == v19)
  {
    v32 = a1;
    v20 = type metadata accessor for Array();
    v21 = MEMORY[0x2199FFD80](MEMORY[0x24BEE12C8], v20);
    zip<A, B>(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v36 = v37;
    v22 = (_QWORD *)swift_allocObject();
    v31 = (uint64_t)&v31;
    v22[2] = a3;
    v22[3] = a4;
    v22[4] = a5;
    v22[5] = a3;
    v30[2] = a3;
    v30[3] = a4;
    v30[4] = a5;
    v30[5] = a8;
    v30[6] = MEMORY[0x24BDAC7A8](v22);
    v32 = v20;
    v33 = v20;
    v34 = v21;
    v35 = v21;
    v23 = type metadata accessor for Zip2Sequence();
    v24 = MEMORY[0x2199FFD80](MEMORY[0x24BEE2620], v23);
    a2 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(a9, (uint64_t)v30, v23, a3, MEMORY[0x24BEE4078], v24, MEMORY[0x24BEE40A8], v25);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a2;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 0x20646E6120;
  v28._object = (void *)0xE500000000000000;
  String.append(_:)(v28);
  v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t Array<A>.DifferentiableView<>.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  if (MEMORY[0x2199FF81C](a2, a3) <= a1)
  {
    swift_bridgeObjectRelease();
    return dispatch thunk of IteratorProtocol.next()();
  }
  else
  {
    Array.subscript.getter();
    return swift_bridgeObjectRelease();
  }
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> [A]<A>.DifferentiableView@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Array<A>.DifferentiableView<>.zero.getter();
  *a1 = result;
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))static Array<A>.DifferentiableView<>.+ infix(_:_:), a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> [A]<A>.DifferentiableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static AdditiveArithmetic.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> [A]<A>.DifferentiableView@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))static Array<A>.DifferentiableView<>.- infix(_:_:), a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, uint64_t *a6@<X8>)
{
  uint64_t result;

  result = a5(*a1, *a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a4 - 8), *(_QWORD *)(a3 + 24));
  *a6 = result;
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> [A]<A>.DifferentiableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static AdditiveArithmetic.+= infix(_:_:)(a1, a2, a3);
}

uint64_t Array<A>.move(by:)(int64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v8 = *v4;
  v6 = type metadata accessor for Array<A>.DifferentiableView(0, *(_QWORD *)(a2 + 16), a3, a4);
  result = Array<A>.DifferentiableView.move(by:)(a1, v6);
  *v4 = v8;
  return result;
}

uint64_t protocol witness for Differentiable.move(by:) in conformance <A> [A](int64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Array<A>.move(by:)(*a1, a2, *(_QWORD *)(a3 - 8), a4);
}

uint64_t (*Array<A>._vjpSubscript(index:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  _QWORD *v9;

  Array.subscript.getter();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a3;
  v9[5] = a2;
  swift_bridgeObjectRetain();
  return partial apply for pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:);
}

uint64_t pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:)(uint64_t a1, uint64_t a2, Swift::Int a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isClassOrObjCExistentialType;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)&v18 - v10;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  v12 = MEMORY[0x2199FF81C](a2, a4);
  v13 = specialized Array.init(repeating:count:)((uint64_t)v11, v12, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
  v19 = v13;
  type metadata accessor for Array();
  Array._makeMutableAndUnique()();
  v14 = v19;
  Array._checkSubscript_mutating(_:)(a3);
  isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  v16 = v14 & 0xFFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0)
    v16 = v14;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 24))(v16+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * a3, a1, AssociatedTypeWitness);
  return v19;
}

uint64_t (*reverse-mode derivative of Array.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  Array<A>._vjpSubscript(index:)(a1, a2, a3, a4, a5);
  v8 = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = partial apply for pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView);
}

uint64_t (*Array<A>._jvpSubscript(index:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  _QWORD *v8;

  Array.subscript.getter();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a4;
  v8[3] = a5;
  v8[4] = a2;
  return partial apply for differential #1 <A>(_:) in Array<A>._jvpSubscript(index:);
}

uint64_t (*forward-mode derivative of Array.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  Array<A>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v8 = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = partial apply for differential #1 <A>(_:) in Array<A>._jvpSubscript(index:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A.Differentiable.TangentVector);
}

uint64_t static Array<A>._vjpConcatenate(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;

  v8 = static Array.+ infix(_:_:)();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t reverse-mode derivative of static Array.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = static Array<A>._vjpConcatenate(_:_:)(a1, a2, a3, a4);
  v8 = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for pullback #1 <A>(_:) in static Array<A>._vjpConcatenate(_:_:);
  v9[5] = v8;
  return v6;
}

uint64_t static Array<A>._jvpConcatenate(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;

  v8 = static Array.+ infix(_:_:)();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t forward-mode derivative of static Array.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = static Array<A>._jvpConcatenate(_:_:)(a1, a2, a3, a4);
  v8 = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for differential #1 <A>(_:_:) in static Array<A>._jvpConcatenate(_:_:);
  v9[5] = v8;
  return v6;
}

uint64_t (*Array<A>._vjpAppend(_:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x2199FF81C](*v3, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  Array.append(_:)();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v6;
  v11[3] = a3;
  v11[4] = v10;
  return partial apply for closure #1 in Array<A>._vjpAppend(_:);
}

uint64_t $defer #1 <A>() in closure #1 in Array<A>._vjpAppend(_:)()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v3 = (char *)&v6 - v2;
  v4 = type metadata accessor for Array();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12B0], v4);
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12E8], v4);
  RangeReplaceableCollection<>.removeLast()();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
}

uint64_t (*reverse-mode derivative of Array.append(_:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  Array<A>._vjpAppend(_:)(a1, a2, a3);
  v7 = v6;
  v8 = *(_QWORD *)(a2 + 16);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v9[3] = a3;
  v9[4] = partial apply for closure #1 in Array<A>._vjpAppend(_:);
  v9[5] = v7;
  return partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A.Differentiable.TangentVector);
}

uint64_t (*Array<A>._jvpAppend(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 16);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  Array.append(_:)();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = a3;
  return partial apply for closure #1 in Array<A>._jvpAppend(_:);
}

uint64_t closure #1 in Array<A>._jvpAppend(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - v5, a2, AssociatedTypeWitness);
  type metadata accessor for Array();
  return Array.append(_:)();
}

uint64_t (*forward-mode derivative of Array.append(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1, uint64_t a2)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  Array<A>._jvpAppend(_:)(a1, a2, a3);
  v7 = v6;
  v8 = *(_QWORD *)(a2 + 16);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v9[3] = a3;
  v9[4] = partial apply for closure #1 in Array<A>._jvpAppend(_:);
  v9[5] = v7;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in A.Differentiable.TangentVector, @inout [A.Differentiable.TangentVector]<A>.DifferentiableView) -> ();
}

uint64_t (*static Array<A>._vjpAppend(_:_:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v6;
  _QWORD *v7;

  v6 = MEMORY[0x2199FF81C](*a1, a3);
  static Array.+= infix(_:_:)();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = v6;
  return partial apply for closure #1 in static Array<A>._vjpAppend(_:_:);
}

uint64_t (*reverse-mode derivative of static Array.+= infix(_:_:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  static Array<A>._vjpAppend(_:_:)(a1, a2, a3, a4);
  v7 = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = partial apply for closure #1 in static Array<A>._vjpAppend(_:_:);
  v8[5] = v7;
  return partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView);
}

uint64_t (*static Array<A>._jvpAppend(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v6;

  static Array.+= infix(_:_:)();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  return partial apply for closure #1 in static Array<A>._jvpAppend(_:_:);
}

uint64_t (*forward-mode derivative of static Array.+= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  static Array<A>._jvpAppend(_:_:)(a1, a2, a3, a4);
  v7 = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = partial apply for closure #1 in static Array<A>._jvpAppend(_:_:);
  v8[5] = v7;
  return partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView);
}

uint64_t static Array<A>._vjpInit(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = specialized Array.init(repeating:count:)(a1, a2, a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  return v6;
}

uint64_t closure #1 in static Array<A>._vjpInit(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = &v12[-v8];
  v16 = a1;
  swift_getAssociatedConformanceWitness();
  swift_bridgeObjectRetain();
  dispatch thunk of IteratorProtocol.next()();
  v13 = a2;
  v14 = a3;
  v15 = AssociatedTypeWitness;
  v10 = type metadata accessor for Array();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12C8], v10);
  Sequence.reduce<A>(_:_:)();
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  return swift_bridgeObjectRelease();
}

uint64_t reverse-mode derivative of Array.init(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v7 = static Array<A>._vjpInit(repeating:count:)(a1, a2, a3, a4);
  v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = partial apply for closure #1 in static Array<A>._vjpInit(repeating:count:);
  v10[5] = v9;
  return v7;
}

uint64_t static Array<A>._jvpInit(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *v8;

  v7 = specialized Array.init(repeating:count:)(a1, a2, a3);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = a2;
  return v7;
}

uint64_t forward-mode derivative of Array.init(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v7 = static Array<A>._jvpInit(repeating:count:)(a1, a2, a3, a4);
  v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = partial apply for closure #1 in static Array<A>._jvpInit(repeating:count:);
  v10[5] = v9;
  return v7;
}

uint64_t Array<A>.differentiableMap<A>(_:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  uint64_t v13;

  v13 = a2;
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = a6;
  v12 = *a1;
  v7 = type metadata accessor for Array();
  v8 = MEMORY[0x2199FFD80](MEMORY[0x24BEE12E0], v7);
  return _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@in_guaranteed A) -> (@out A1), (uint64_t)v11, v7, a4, MEMORY[0x24BEE4078], v8, MEMORY[0x24BEE40A8], v9);
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  char *v26;
  char *v27;
  void (*v28)(char *, _QWORD);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, char *);
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char v51[40];
  uint64_t v52;

  v39 = a5;
  v40 = a8;
  v46 = a1;
  v47 = a2;
  v38 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v48 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v43 = (char *)&v34 - v15;
  v16 = a4;
  MEMORY[0x24BDAC7A8](v14);
  v42 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v37 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v34 - v21;
  v41 = v8;
  v23 = a6;
  v24 = dispatch thunk of Collection.count.getter();
  if (!v24)
    return static Array._allocateUninitialized(_:)();
  v25 = v24;
  v36 = v18;
  v52 = MEMORY[0x2199FF9CC](v16);
  v45 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v25);
  v35 = v22;
  dispatch thunk of Collection.startIndex.getter();
  if (v25 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v49 = v23;
    v26 = v43;
    v27 = v35;
    while (1)
    {
      v28 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
      (*(void (**)(char *))(v13 + 16))(v26);
      v28(v51, 0);
      v29 = v50;
      v46(v26, v48);
      if (v29)
        break;
      v50 = 0;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v26, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      if (!--v25)
      {
        v30 = v44;
        v32 = v36;
        v31 = v37;
        (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v37, v27, v36);
        _expectEnd<A>(of:is:)();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
        return v52;
      }
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v26, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v27, v36);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v38 + 32))(v40, v48, v39);
  }
  return result;
}

uint64_t Array<A>._vjpDifferentiableMap<A>(_:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Bool IsNativeType;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t FunctionTypeMetadata1;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[2];
  _OWORD v48[3];
  uint64_t v49;
  uint64_t v50;

  v11 = *a1;
  v43 = a1[1];
  v44 = v11;
  v42 = a1[2];
  v12 = MEMORY[0x24BDAC7A8](a1);
  v41 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v17;
  MEMORY[0x24BDAC7A8](v16);
  v45 = (char *)&v36 - v19;
  v39 = static Array._allocateUninitialized(_:)();
  v50 = v39;
  v37 = a5;
  swift_getAssociatedTypeWitness();
  v38 = a6;
  v46 = a4;
  swift_getAssociatedTypeWitness();
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  v20 = static Array._allocateUninitialized(_:)();
  v49 = v20;
  if (MEMORY[0x2199FF834](a2, a3))
  {
    v21 = 0;
    v22 = (uint64_t)v41;
    while (1)
    {
      IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v18, a2+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v21, a3);
        v24 = (uint64_t)v45;
      }
      else
      {
        v31 = _ArrayBuffer._getElementSlowPath(_:)();
        v24 = (uint64_t)v45;
        if (v36 != 8)
          goto LABEL_12;
        v47[0] = v31;
        (*(void (**)(char *, _QWORD *, uint64_t))(v15 + 16))(v18, v47, a3);
        swift_unknownObjectRelease();
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v24, v18, a3);
      v26 = v21 + 1;
      if (__OFADD__(v21, 1))
        break;
      v48[0] = v44;
      v48[1] = v43;
      v48[2] = v42;
      v27 = valueWithPullback<A, B>(at:of:)(v22, v24, (uint64_t)v48, v25, v46);
      v28 = v24;
      v30 = v29;
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v28, a3);
      type metadata accessor for Array();
      Array.append(_:)();
      v47[0] = v27;
      v47[1] = v30;
      type metadata accessor for Array();
      Array.append(_:)();
      ++v21;
      if (v26 == MEMORY[0x2199FF834](a2, a3))
      {
        v20 = v49;
        v39 = v50;
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    swift_unknownObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
LABEL_10:
    v32 = (_QWORD *)swift_allocObject();
    v33 = v46;
    v32[2] = a3;
    v32[3] = v33;
    v34 = v38;
    v32[4] = v37;
    v32[5] = v34;
    v32[6] = v20;
    return v39;
  }
  return result;
}

uint64_t specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[8];
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;

  swift_getAssociatedTypeWitness();
  v10 = type metadata accessor for Array();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  v11 = type metadata accessor for Array();
  v12 = MEMORY[0x24BEE12C8];
  v13 = MEMORY[0x2199FFD80](MEMORY[0x24BEE12C8], v10);
  v14 = MEMORY[0x2199FFD80](v12, v11);
  zip<A, B>(_:_:)();
  v31 = v32;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  v21[5] = a6;
  v21[6] = partial apply for closure #1 in pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:);
  v21[7] = &v22;
  v27 = v10;
  v28 = v11;
  v29 = v13;
  v30 = v14;
  v15 = type metadata accessor for Zip2Sequence();
  v16 = (char *)swift_checkMetadataState();
  v17 = MEMORY[0x2199FFD80](MEMORY[0x24BEE2620], v15);
  v19 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))_s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA, (uint64_t)v21, v15, v16, MEMORY[0x24BEE4078], v17, MEMORY[0x24BEE40A8], v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD))
{
  uint64_t TupleTypeMetadata2;

  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, *(_QWORD *)(a1 + *(int *)(TupleTypeMetadata2 + 48)), *(_QWORD *)(a1 + *(int *)(TupleTypeMetadata2 + 48) + 8));
}

uint64_t reverse-mode derivative of Array<A>.differentiableMap<A>(_:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  __int128 v16[3];

  v10 = a1[1];
  v16[0] = *a1;
  v16[1] = v10;
  v16[2] = a1[2];
  v11 = Array<A>._vjpDifferentiableMap<A>(_:)(v16, a2, a3, a4, a5, a6);
  v13 = v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  v14[6] = partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:);
  v14[7] = v13;
  return v11;
}

uint64_t Array<A>._jvpDifferentiableMap<A>(_:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Bool IsNativeType;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t FunctionTypeMetadata1;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[2];
  _OWORD v48[3];
  uint64_t v49;
  uint64_t v50;

  v11 = *a1;
  v43 = a1[1];
  v44 = v11;
  v42 = a1[2];
  v12 = MEMORY[0x24BDAC7A8](a1);
  v41 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v17;
  MEMORY[0x24BDAC7A8](v16);
  v45 = (char *)&v36 - v19;
  v39 = static Array._allocateUninitialized(_:)();
  v50 = v39;
  v38 = a6;
  v46 = a4;
  swift_getAssociatedTypeWitness();
  v37 = a5;
  swift_getAssociatedTypeWitness();
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  v20 = static Array._allocateUninitialized(_:)();
  v49 = v20;
  if (MEMORY[0x2199FF834](a2, a3))
  {
    v21 = 0;
    v22 = (uint64_t)v41;
    while (1)
    {
      IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v18, a2+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v21, a3);
        v24 = (uint64_t)v45;
      }
      else
      {
        v31 = _ArrayBuffer._getElementSlowPath(_:)();
        v24 = (uint64_t)v45;
        if (v36 != 8)
          goto LABEL_12;
        v47[0] = v31;
        (*(void (**)(char *, _QWORD *, uint64_t))(v15 + 16))(v18, v47, a3);
        swift_unknownObjectRelease();
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v24, v18, a3);
      v26 = v21 + 1;
      if (__OFADD__(v21, 1))
        break;
      v48[0] = v44;
      v48[1] = v43;
      v48[2] = v42;
      v27 = valueWithDifferential<A, B>(at:of:)(v22, v24, (uint64_t)v48, v25, v46);
      v28 = v24;
      v30 = v29;
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v28, a3);
      type metadata accessor for Array();
      Array.append(_:)();
      v47[0] = v27;
      v47[1] = v30;
      type metadata accessor for Array();
      Array.append(_:)();
      ++v21;
      if (v26 == MEMORY[0x2199FF834](a2, a3))
      {
        v20 = v49;
        v39 = v50;
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    swift_unknownObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
LABEL_10:
    v32 = (_QWORD *)swift_allocObject();
    v33 = v46;
    v32[2] = a3;
    v32[3] = v33;
    v34 = v38;
    v32[4] = v37;
    v32[5] = v34;
    v32[6] = v20;
    return v39;
  }
  return result;
}

uint64_t specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[8];
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;

  swift_getAssociatedTypeWitness();
  v10 = type metadata accessor for Array();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  v11 = type metadata accessor for Array();
  v12 = MEMORY[0x24BEE12C8];
  v13 = MEMORY[0x2199FFD80](MEMORY[0x24BEE12C8], v10);
  v14 = MEMORY[0x2199FFD80](v12, v11);
  zip<A, B>(_:_:)();
  v31 = v32;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  v21[5] = a6;
  v21[6] = partial apply for closure #1 in differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:);
  v21[7] = &v22;
  v27 = v10;
  v28 = v11;
  v29 = v13;
  v30 = v14;
  v15 = type metadata accessor for Zip2Sequence();
  v16 = (char *)swift_checkMetadataState();
  v17 = MEMORY[0x2199FFD80](MEMORY[0x24BEE2620], v15);
  v19 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))_s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA, (uint64_t)v21, v15, v16, MEMORY[0x24BEE4078], v17, MEMORY[0x24BEE40A8], v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD))
{
  uint64_t TupleTypeMetadata2;

  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, *(_QWORD *)(a1 + *(int *)(TupleTypeMetadata2 + 48)), *(_QWORD *)(a1 + *(int *)(TupleTypeMetadata2 + 48) + 8));
}

uint64_t forward-mode derivative of Array<A>.differentiableMap<A>(_:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  __int128 v16[3];

  v10 = a1[1];
  v16[0] = *a1;
  v16[1] = v10;
  v16[2] = a1[2];
  v11 = Array<A>._jvpDifferentiableMap<A>(_:)(v16, a2, a3, a4, a5, a6);
  v13 = v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  v14[6] = partial apply for specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:);
  v14[7] = v13;
  return v11;
}

uint64_t Array<A>.differentiableReduce<A>(_:_:)()
{
  uint64_t v0;

  v0 = type metadata accessor for Array();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12C8], v0);
  return Sequence.reduce<A>(_:_:)();
}

uint64_t (*Array<A>._vjpDifferentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  Swift::Int v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::Bool IsNativeType;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v50;
  Swift::Int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  _OWORD v67[3];
  uint64_t v68;

  v65 = a2;
  v52 = a1;
  v11 = *a3;
  v57 = a3[1];
  v58 = v11;
  v56 = a3[2];
  v12 = *(_QWORD *)(a5 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v60 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v59 = (char *)&v50 - v16;
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v15);
  v55 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v50 - v21;
  v64 = v23;
  swift_getAssociatedTypeWitness();
  v63 = a7;
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  swift_getFunctionTypeMetadata1();
  v68 = static Array._allocateUninitialized(_:)();
  v24 = MEMORY[0x2199FF81C](a4, a5);
  v54 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(v24);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v61 = a6;
  v62 = v22;
  v25(v22, v65, a6);
  if (MEMORY[0x2199FF834](a4, a5))
  {
    v51 = v24;
    v53 = v18;
    v26 = 0;
    v27 = (uint64_t)v55;
    v28 = (uint64_t)v62;
    while (1)
    {
      IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        v30 = v60;
        (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v60, a4+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v26, a5);
        v31 = (uint64_t)v59;
      }
      else
      {
        v44 = _ArrayBuffer._getElementSlowPath(_:)();
        v31 = (uint64_t)v59;
        v30 = v60;
        if (v50 != 8)
          goto LABEL_13;
        v66[0] = v44;
        (*(void (**)(char *, _QWORD *, uint64_t))(v12 + 16))(v60, v66, a5);
        swift_unknownObjectRelease();
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v31, v30, a5);
      v34 = v26 + 1;
      if (__OFADD__(v26, 1))
        break;
      v67[0] = v58;
      v67[1] = v57;
      v67[2] = v56;
      v35 = a4;
      v36 = v61;
      v37 = valueWithPullback<A, B, C>(at:_:of:)(v27, v28, v31, (uint64_t)v67, v32, v33, v61);
      v65 = v38;
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v31, a5);
      v39 = v53;
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v28, v36);
      v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32);
      v40(v28, v27, v36);
      v41 = (_QWORD *)swift_allocObject();
      v41[2] = a5;
      v41[3] = v36;
      a4 = v35;
      v42 = v64;
      v41[4] = v63;
      v41[5] = v42;
      v43 = v65;
      v41[6] = v37;
      v41[7] = v43;
      v66[0] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector);
      v66[1] = v41;
      Array.append(_:)();
      ++v26;
      if (v34 == MEMORY[0x2199FF834](v35, a5))
      {
        v24 = v51;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    swift_unknownObjectRelease();
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
LABEL_11:
    v45 = v61;
    v40(v52, (uint64_t)v62, v61);
    v46 = v68;
    v47 = (_QWORD *)swift_allocObject();
    v47[2] = a5;
    v47[3] = v45;
    v48 = v64;
    v47[4] = v63;
    v47[5] = v48;
    v47[6] = v24;
    v47[7] = v46;
    return partial apply for specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t TupleTypeMetadata2;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a1);
}

uint64_t specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, Swift::Int a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t FunctionTypeMetadata1;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Bool IsNativeType;
  void (*v26)(char *);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v32 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v10 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v12 = (char *)&v32 - v11;
  v33 = *(_QWORD *)(v8 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v37 = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v32 - v16, a2, AssociatedTypeWitness);
  v41 = static Array._allocateUninitialized(_:)();
  v35 = v8;
  v36 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(a3);
  v38 = AssociatedTypeWitness;
  v39 = a4;
  v34 = TupleTypeMetadata2;
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  v20 = type metadata accessor for Array();
  swift_bridgeObjectRetain();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12B0], v20);
  BidirectionalCollection.reversed()();
  v21 = v40;
  v22 = MEMORY[0x2199FF834](v40, FunctionTypeMetadata1);
  if (v22)
  {
    v23 = v22;
    while (!__OFSUB__(v23--, 1))
    {
      IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (!IsNativeType)
        goto LABEL_8;
      v26 = *(void (**)(char *))(v21 + 32 + 16 * v23);
      v27 = &v12[*(int *)(v34 + 48)];
      swift_retain();
      v26(v17);
      swift_release();
      v29 = v37;
      v28 = v38;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v38);
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v17, v12, v28);
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v15, v27, v35);
      Array.append(_:)();
      if (!v23)
        goto LABEL_6;
    }
    __break(1u);
LABEL_8:
    _ArrayBuffer._getElementSlowPath(_:)();
    swift_unknownObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    v40 = v41;
    swift_bridgeObjectRetain();
    MEMORY[0x2199FFD80](MEMORY[0x24BEE12C8], v36);
    v30 = Sequence.reversed()();
    (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v32, v17, v38);
    swift_bridgeObjectRelease();
    return v30;
  }
  return result;
}

uint64_t (*reverse-mode derivative of Array<A>.differentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v17[3];

  v12 = a3[1];
  v17[0] = *a3;
  v17[1] = v12;
  v17[2] = a3[2];
  Array<A>._vjpDifferentiableReduce<A>(_:_:)(a1, a2, v17, a4, a5, a6, a7);
  v14 = v13;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a5;
  v15[3] = a6;
  v15[4] = a7;
  v15[5] = a8;
  v15[6] = partial apply for specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:);
  v15[7] = v14;
  return partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A1.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView);
}

uint64_t (*Array<A>._jvpDifferentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  Swift::Bool IsNativeType;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t (*result)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[2];
  _OWORD v65[3];
  uint64_t v66;

  v62 = a4;
  v63 = a2;
  v50 = a1;
  v10 = *a3;
  v57 = a3[1];
  v58 = v10;
  v56 = a3[2];
  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v48 - v16;
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v15);
  v55 = (uint64_t)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v48 - v21;
  v52 = v23;
  swift_getAssociatedTypeWitness();
  v51 = a7;
  v24 = v62;
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata2();
  v66 = static Array._allocateUninitialized(_:)();
  v25 = MEMORY[0x2199FF81C](v24, a5);
  v54 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(v25);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v60 = v22;
  v61 = a6;
  v26(v22, v63, a6);
  if (MEMORY[0x2199FF834](v24, a5))
  {
    v53 = v18;
    v27 = 0;
    v28 = (uint64_t)v60;
    while (1)
    {
      IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v14, v24+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v27, a5);
        v30 = (uint64_t)v59;
      }
      else
      {
        v42 = _ArrayBuffer._getElementSlowPath(_:)();
        v30 = (uint64_t)v59;
        if (v49 != 8)
          goto LABEL_13;
        v64[0] = v42;
        (*(void (**)(char *, _QWORD *, uint64_t))(v11 + 16))(v14, v64, a5);
        swift_unknownObjectRelease();
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v30, v14, a5);
      v33 = v27 + 1;
      if (__OFADD__(v27, 1))
        break;
      v65[0] = v58;
      v65[1] = v57;
      v65[2] = v56;
      v34 = v55;
      v35 = v14;
      v36 = v61;
      v63 = valueWithDifferential<A, B, C>(at:_:of:)(v55, v28, v30, (uint64_t)v65, v31, v32, v61);
      v38 = v37;
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v30, a5);
      v39 = v53;
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v28, v36);
      v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32);
      v41 = v36;
      v14 = v35;
      v40(v28, v34, v41);
      v64[0] = v63;
      v64[1] = v38;
      v24 = v62;
      Array.append(_:)();
      ++v27;
      if (v33 == MEMORY[0x2199FF834](v24, a5))
        goto LABEL_11;
    }
    __break(1u);
LABEL_13:
    swift_unknownObjectRelease();
    result = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
LABEL_11:
    v43 = v61;
    v40(v50, (uint64_t)v60, v61);
    v44 = v66;
    v45 = (_QWORD *)swift_allocObject();
    v45[2] = a5;
    v45[3] = v43;
    v46 = v52;
    v45[4] = v51;
    v45[5] = v46;
    v45[6] = v44;
    return partial apply for specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:);
  }
  return result;
}

uint64_t specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t TupleTypeMetadata2;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *i;
  void (*v26)(uint64_t, char *);
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v33 = (char *)&v30 - v10;
  v11 = swift_getAssociatedTypeWitness();
  v31 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v30 - v12;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v15 = type metadata accessor for Optional();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v30 - v16;
  v34 = v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a4, a2, AssociatedTypeWitness);
  v42 = a1;
  *(_QWORD *)&v41 = a3;
  v18 = type metadata accessor for Array();
  v32 = AssociatedTypeWitness;
  swift_getFunctionTypeMetadata2();
  v19 = type metadata accessor for Array();
  v20 = MEMORY[0x24BEE12C8];
  v21 = MEMORY[0x2199FFD80](MEMORY[0x24BEE12C8], v18);
  v22 = MEMORY[0x2199FFD80](v20, v19);
  zip<A, B>(_:_:)();
  v41 = v38;
  v36 = v19;
  v37 = v18;
  v42 = v18;
  v43 = v19;
  v35 = v21;
  v44 = v21;
  v45 = v22;
  v23 = v22;
  type metadata accessor for Zip2Sequence();
  Zip2Sequence.makeIterator()();
  v24 = v31;
  for (i = v33; ; (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(a4, i, v28))
  {
    *(_QWORD *)&v38 = v37;
    *((_QWORD *)&v38 + 1) = v36;
    v39 = v35;
    v40 = v23;
    type metadata accessor for Zip2Sequence.Iterator();
    Zip2Sequence.Iterator.next()();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48))(v17, 1, TupleTypeMetadata2) == 1)break;
    v26 = *(void (**)(uint64_t, char *))&v17[*(int *)(TupleTypeMetadata2 + 48)];
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v13, v17, v11);
    v26(a4, v13);
    swift_release();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
    v27 = v34;
    v28 = v32;
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(a4, v32);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*forward-mode derivative of Array<A>.differentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v17[3];

  v12 = a3[1];
  v17[0] = *a3;
  v17[1] = v12;
  v17[2] = a3[2];
  Array<A>._jvpDifferentiableReduce<A>(_:_:)(a1, a2, v17, a4, a5, a6, a7);
  v14 = v13;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a5;
  v15[3] = a6;
  v15[4] = a7;
  v15[5] = a8;
  v15[6] = partial apply for specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:);
  v15[7] = v14;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector, @guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A1.Differentiable.TangentVector);
}

uint64_t Optional<A>.TangentVector.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getAssociatedTypeWitness();
  v3 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Optional<A>.TangentVector.value.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_getAssociatedTypeWitness();
  v3 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*Optional<A>.TangentVector.value.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t Optional<A>.TangentVector.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a2, 1, 1, AssociatedTypeWitness);
  v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
}

uint64_t static Optional<A>.TangentVector.zero.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = type metadata accessor for Optional();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v7 - v4;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v5, 0, 1, AssociatedTypeWitness);
  return Optional<A>.TangentVector.init(_:)((uint64_t)v5, a1);
}

uint64_t static Optional<A>.TangentVector.+ infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t AssociatedConformanceWitness;
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v30 = a2;
  v31 = a5;
  v32 = a3;
  v33 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  v13 = type metadata accessor for Optional();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v20 = (char *)&v30 - v19;
  v21 = (char *)&v30 + *(int *)(v18 + 48) - v19;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v22((char *)&v30 - v19, a1, v13);
  v22(v21, v30, v13);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v13) = v23(v20, 1, AssociatedTypeWitness);
  v24 = v23(v21, 1, AssociatedTypeWitness);
  if ((_DWORD)v13 != 1)
  {
    v26 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    if (v24 != 1)
    {
      v26(v12, v20, AssociatedTypeWitness);
      v26(v10, v21, AssociatedTypeWitness);
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      MEMORY[0x2199FF9FC](v12, v10, AssociatedTypeWitness, AssociatedConformanceWitness);
      v28 = *(void (**)(char *, uint64_t))(v7 + 8);
      v28(v10, AssociatedTypeWitness);
      v28(v12, AssociatedTypeWitness);
      v25 = 0;
      goto LABEL_10;
    }
    v26(v16, v20, AssociatedTypeWitness);
LABEL_7:
    v25 = 0;
    goto LABEL_10;
  }
  if (v24 != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v21, AssociatedTypeWitness);
    goto LABEL_7;
  }
  v25 = 1;
LABEL_10:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v16, v25, 1, AssociatedTypeWitness);
  return Optional<A>.TangentVector.init(_:)((uint64_t)v16, v31);
}

uint64_t static Optional<A>.TangentVector.- infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v29 = a2;
  v30 = a5;
  v31 = a3;
  v32 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - v11;
  v13 = type metadata accessor for Optional();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v29 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v20 = (char *)&v29 - v19;
  v21 = (char *)&v29 + *(int *)(v18 + 48) - v19;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v22((char *)&v29 - v19, a1, v13);
  v22(v21, v29, v13);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v13) = v23(v20, 1, AssociatedTypeWitness);
  v24 = v23(v21, 1, AssociatedTypeWitness);
  if ((_DWORD)v13 != 1)
  {
    v26 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    if (v24 == 1)
    {
      v26(v16, v20, AssociatedTypeWitness);
      v25 = 0;
      goto LABEL_10;
    }
    v26(v12, v20, AssociatedTypeWitness);
    v26(v10, v21, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    goto LABEL_9;
  }
  if (v24 != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v21, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    dispatch thunk of IteratorProtocol.next()();
LABEL_9:
    dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
    v27 = *(void (**)(char *, uint64_t))(v7 + 8);
    v27(v10, AssociatedTypeWitness);
    v27(v12, AssociatedTypeWitness);
    v25 = 0;
    goto LABEL_10;
  }
  v25 = 1;
LABEL_10:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v16, v25, 1, AssociatedTypeWitness);
  return Optional<A>.TangentVector.init(_:)((uint64_t)v16, v30);
}

uint64_t Optional<A>.TangentVector.move(by:)(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t AssociatedConformanceWitness;
  _QWORD v14[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = type metadata accessor for Optional();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v14 - v6;
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v14 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v11(v7, 1, AssociatedTypeWitness) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, AssociatedTypeWitness);
  if (!v11((char *)v14[1], 1, AssociatedTypeWitness))
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v10, AssociatedTypeWitness, AssociatedConformanceWitness);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
}

BOOL static Optional<A>.TangentVector.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t TupleTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a2;
  v26 = a4;
  v27 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v25 = (char *)&v24 - v7;
  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - v10;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v13 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v14 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v16 = (char *)&v24 - v15;
  v17 = (char *)&v24 + *(int *)(v14 + 48) - v15;
  v28 = v9;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18((char *)&v24 - v15, a1, v8);
  v18(v17, v29, v8);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (v19(v16, 1, AssociatedTypeWitness) == 1)
  {
    if (v19(v17, 1, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v8);
      return 1;
    }
    goto LABEL_6;
  }
  v18(v11, (uint64_t)v16, v8);
  if (v19(v17, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, AssociatedTypeWitness);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, TupleTypeMetadata2);
    return 0;
  }
  v20 = v25;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v25, v17, AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  v21 = dispatch thunk of static Equatable.== infix(_:_:)();
  v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v22(v20, AssociatedTypeWitness);
  v22(v11, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v8);
  return (v21 & 1) != 0;
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance A?<A>.TangentVector@<X0>(uint64_t a1@<X8>)
{
  return static Optional<A>.TangentVector.zero.getter(a1);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance A?<A>.TangentVector@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return static Optional<A>.TangentVector.+ infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance A?<A>.TangentVector@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return static Optional<A>.TangentVector.- infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance A?<A>.TangentVector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Optional<A>.TangentVector.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t Optional<A>.move(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;

  v6 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v17 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, AssociatedTypeWitness);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v3, 1, v6))
    (*(void (**)(char *, uint64_t, uint64_t))(a3 + 32))(v15, v6, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
}

uint64_t protocol witness for Differentiable.move(by:) in conformance <A> A?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Optional<A>.move(by:)(a1, a2, *(_QWORD *)(a3 - 8));
}

uint64_t Optional<A>.TangentVector.customMirror.getter()
{
  swift_getAssociatedTypeWitness();
  type metadata accessor for Optional();
  return Optional.customMirror.getter();
}

__int16 Float16.move(by:)@<H0>(__n128 _Q0@<Q0>)
{
  __int16 *v1;
  __int16 result;

  _H1 = *v1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 + _S0;
  __asm { FCVT            H0, S0 }
  *v1 = result;
  return result;
}

__int16 protocol witness for Differentiable.move(by:) in conformance Float16@<H0>(__int16 *a1@<X0>)
{
  __int16 *v1;
  __int16 result;

  _H0 = *a1;
  _H1 = *v1;
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 + _S1;
  __asm { FCVT            H0, S0 }
  *v1 = result;
  return result;
}

uint64_t (*static Float16._vjpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Float16._jvpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Float16._vjpInit(x:)(float _S0))()
{
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._vjpInit(x:);
}

uint64_t (*static Float16._jvpInit(x:)(float _S0))()
{
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._jvpInit(x:);
}

uint64_t (*static Float16._vjpInit(x:)(double _D0))()
{
  __asm { FCVT            H0, D0 }
  return closure #1 in static Float16._vjpInit(x:);
}

uint64_t (*static Float16._jvpInit(x:)(double _D0))()
{
  __asm { FCVT            H0, D0 }
  return closure #1 in static Float16._jvpInit(x:);
}

uint64_t (*static Float16._vjpNegate(x:)(__n128 _Q0))()
{
  __asm { FCVT            S0, H0 }
  _S0 = -_S0;
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._vjpNegate(x:);
}

__int16 (*static Float16._jvpNegate(x:)(__n128 _Q0))@<H0>(__n128 _Q0@<Q0>)
{
  __asm { FCVT            S0, H0 }
  _S0 = -_S0;
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._jvpNegate(x:);
}

__int16 closure #1 in static Float16._jvpNegate(x:)@<H0>(__n128 _Q0@<Q0>)
{
  __int16 result;

  __asm { FCVT            S0, H0 }
  _S0 = -_S0;
  __asm { FCVT            H0, S0 }
  return result;
}

void (*static Float16._vjpAdd(lhs:rhs:)(__n128 _Q0, __n128 _Q1))()
{
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 + _S1;
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._vjpAdd(lhs:rhs:);
}

__int16 (*static Float16._jvpAdd(lhs:rhs:)(__n128 _Q0, __n128 _Q1))@<H0>(__n128 _Q0@<Q0>, __n128 _Q1@<Q1>)
{
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 + _S1;
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._jvpAdd(lhs:rhs:);
}

__int16 closure #1 in static Float16._jvpAdd(lhs:rhs:)@<H0>(__n128 _Q0@<Q0>, __n128 _Q1@<Q1>)
{
  __int16 result;

  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 + _S1;
  __asm { FCVT            H0, S0 }
  return result;
}

__int16 (*static Float16._vjpAddAssign(_:_:)(__int16 *a1, __n128 _Q0))@<H0>(uint64_t a1@<X0>)
{
  _H1 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 + _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return closure #1 in static Float16._vjpAddAssign(_:_:);
}

__int16 closure #1 in static Float16._vjpAddAssign(_:_:)@<H0>(uint64_t a1@<X0>)
{
  return *(_WORD *)a1;
}

__int16 (*static Float16._jvpAddAssign(_:_:)(__int16 *a1, __n128 _Q0))@<H0>(__int16 *a1@<X0>, __n128 _Q0@<Q0>)
{
  _H1 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 + _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return closure #1 in static Float16._jvpAddAssign(_:_:);
}

__int16 closure #1 in static Float16._jvpAddAssign(_:_:)@<H0>(__int16 *a1@<X0>, __n128 _Q0@<Q0>)
{
  __int16 result;

  _H1 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 + _S0;
  __asm { FCVT            H0, S0 }
  *a1 = result;
  return result;
}

void (*static Float16._vjpSubtract(lhs:rhs:)(__n128 _Q0, __n128 _Q1))(__n128 _Q0)
{
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 - _S1;
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._vjpSubtract(lhs:rhs:);
}

void closure #1 in static Float16._vjpSubtract(lhs:rhs:)(__n128 _Q0)
{
  __asm { FCVT            S1, H0 }
  _S1 = -_S1;
  __asm { FCVT            H1, S1 }
}

__int16 (*static Float16._jvpSubtract(lhs:rhs:)(__n128 _Q0, __n128 _Q1))@<H0>(__n128 _Q0@<Q0>, __n128 _Q1@<Q1>)
{
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 - _S1;
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._jvpSubtract(lhs:rhs:);
}

__int16 closure #1 in static Float16._jvpSubtract(lhs:rhs:)@<H0>(__n128 _Q0@<Q0>, __n128 _Q1@<Q1>)
{
  __int16 result;

  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 - _S1;
  __asm { FCVT            H0, S0 }
  return result;
}

__int16 (*static Float16._vjpSubtractAssign(_:_:)(__int16 *a1, __n128 _Q0))@<H0>(__int16 *a1@<X0>)
{
  _H1 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 - _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return closure #1 in static Float16._vjpSubtractAssign(_:_:);
}

__int16 closure #1 in static Float16._vjpSubtractAssign(_:_:)@<H0>(__int16 *a1@<X0>)
{
  __int16 result;

  _H0 = *a1;
  __asm { FCVT            S0, H0 }
  _S0 = -_S0;
  __asm { FCVT            H0, S0 }
  return result;
}

__int16 (*static Float16._jvpSubtractAssign(_:_:)(__int16 *a1, __n128 _Q0))@<H0>(__int16 *a1@<X0>, __n128 _Q0@<Q0>)
{
  _H1 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 - _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return closure #1 in static Float16._jvpSubtractAssign(_:_:);
}

__int16 closure #1 in static Float16._jvpSubtractAssign(_:_:)@<H0>(__int16 *a1@<X0>, __n128 _Q0@<Q0>)
{
  __int16 result;

  _H1 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 - _S0;
  __asm { FCVT            H0, S0 }
  *a1 = result;
  return result;
}

float static Float16._vjpMultiply(lhs:rhs:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = v3;
  *(_WORD *)(v12 + 18) = _H9;
  return _S10;
}

float reverse-mode derivative of static Float16.* infix(_:_:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = v3;
  *(_WORD *)(v12 + 18) = _H9;
  return _S10;
}

float static Float16._jvpMultiply(lhs:rhs:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = _H9;
  *(_WORD *)(v12 + 18) = v3;
  return _S10;
}

float forward-mode derivative of static Float16.* infix(_:_:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = _H9;
  *(_WORD *)(v12 + 18) = v3;
  return _S10;
}

__int16 (*static Float16._vjpMultiplyAssign(_:_:)(__int16 *a1, __n128 a2))@<H0>(__int16 *a1@<X0>)
{
  uint64_t v5;

  _H8 = a2.n128_u16[0];
  _H9 = *a1;
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = _H9;
  *(_WORD *)(v5 + 18) = _H8;
  __asm
  {
    FCVT            S0, H8
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return partial apply for closure #1 in static Float16._vjpMultiplyAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float16.*= infix(_:_:)(__int16 *a1, __n128 a2))()
{
  uint64_t v5;

  _H8 = a2.n128_u16[0];
  _H9 = *a1;
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = _H9;
  *(_WORD *)(v5 + 18) = _H8;
  __asm
  {
    FCVT            S0, H8
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return closure #1 in static Float16._vjpMultiplyAssign(_:_:)partial apply;
}

__int16 (*static Float16._jvpMultiplyAssign(_:_:)(__int16 *a1, __n128 _Q0))@<H0>(__int16 *a1@<X0>, __n128 _Q0@<Q0>)
{
  unsigned __int16 v2;
  uint64_t v11;

  v2 = _Q0.n128_u16[0];
  _H9 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  v11 = swift_allocObject();
  *(_WORD *)(v11 + 16) = v2;
  *(_WORD *)(v11 + 18) = _H9;
  return partial apply for closure #1 in static Float16._jvpMultiplyAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float16.*= infix(_:_:)(__int16 *a1, __n128 _Q0))()
{
  unsigned __int16 v2;
  uint64_t v11;

  v2 = _Q0.n128_u16[0];
  _H9 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H9
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  v11 = swift_allocObject();
  *(_WORD *)(v11 + 16) = v2;
  *(_WORD *)(v11 + 18) = _H9;
  return closure #1 in static Float16._jvpMultiplyAssign(_:_:)partial apply;
}

float static Float16._vjpDivide(lhs:rhs:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = v3;
  *(_WORD *)(v12 + 18) = _H9;
  return _S10;
}

float reverse-mode derivative of static Float16./ infix(_:_:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = v3;
  *(_WORD *)(v12 + 18) = _H9;
  return _S10;
}

float static Float16._jvpDivide(lhs:rhs:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = v3;
  *(_WORD *)(v12 + 18) = _H9;
  return _S10;
}

float forward-mode derivative of static Float16./ infix(_:_:)(__n128 a1, __n128 _Q1)
{
  unsigned __int16 v3;
  uint64_t v12;

  v3 = _Q1.n128_u16[0];
  _H9 = a1.n128_u16[0];
  __asm
  {
    FCVT            S0, H1
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H10, S0 }
  v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = v3;
  *(_WORD *)(v12 + 18) = _H9;
  return _S10;
}

uint64_t (*static Float16._vjpDivideAssign(_:_:)(__int16 *a1, __n128 a2))()
{
  uint64_t v5;

  _H8 = a2.n128_u16[0];
  _H9 = *a1;
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = _H9;
  *(_WORD *)(v5 + 18) = _H8;
  __asm
  {
    FCVT            S0, H8
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return partial apply for closure #1 in static Float16._vjpDivideAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float16./= infix(_:_:)(__int16 *a1, __n128 a2))()
{
  uint64_t v5;

  _H8 = a2.n128_u16[0];
  _H9 = *a1;
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = _H9;
  *(_WORD *)(v5 + 18) = _H8;
  __asm
  {
    FCVT            S0, H8
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  return partial apply for closure #1 in static Float16._vjpDivideAssign(_:_:);
}

uint64_t (*static Float16._jvpDivideAssign(_:_:)(__int16 *a1, __n128 _Q0))()
{
  unsigned __int16 v2;
  uint64_t v11;

  v2 = _Q0.n128_u16[0];
  _H9 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  v11 = swift_allocObject();
  *(_WORD *)(v11 + 16) = v2;
  *(_WORD *)(v11 + 18) = _H9;
  return partial apply for closure #1 in static Float16._jvpDivideAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float16./= infix(_:_:)(__int16 *a1, __n128 _Q0))()
{
  unsigned __int16 v2;
  uint64_t v11;

  v2 = _Q0.n128_u16[0];
  _H9 = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H9
  }
  _S0 = _S1 / _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  v11 = swift_allocObject();
  *(_WORD *)(v11 + 16) = v2;
  *(_WORD *)(v11 + 18) = _H9;
  return partial apply for closure #1 in static Float16._jvpDivideAssign(_:_:);
}

Swift::Void __swiftcall Float.move(by:)(Swift::Float by)
{
  float *v1;

  *v1 = *v1 + by;
}

float protocol witness for Differentiable.move(by:) in conformance Float(float *a1)
{
  float *v1;
  float result;

  result = *a1 + *v1;
  *v1 = result;
  return result;
}

__int16 (*static Float._vjpInit(x:)(__n128 _Q0))@<H0>(float _S0@<S0>)
{
  __asm { FCVT            S0, H0 }
  return closure #1 in static Float._vjpInit(x:);
}

__int16 closure #1 in static Float._vjpInit(x:)@<H0>(float _S0@<S0>)
{
  __int16 result;

  __asm { FCVT            H0, S0 }
  return result;
}

float (*static Float._jvpInit(x:)(__n128 _Q0))(__n128 _Q0)
{
  __asm { FCVT            S0, H0 }
  return closure #1 in static Float._jvpInit(x:);
}

float closure #1 in static Float._jvpInit(x:)(__n128 _Q0)
{
  float result;

  __asm { FCVT            S0, H0 }
  return result;
}

uint64_t (*static Float._vjpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

{
  return closure #1 in static Float._vjpInit(x:);
}

uint64_t (*static Float._jvpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

{
  return closure #1 in static Float._jvpInit(x:);
}

uint64_t (*static Float._vjpNegate(x:)())()
{
  return closure #1 in static Float._vjpNegate(x:);
}

float (*static Float._jvpNegate(x:)())(float a1)
{
  return closure #1 in static Float._jvpNegate(x:);
}

float closure #1 in static Float._jvpNegate(x:)(float a1)
{
  return -a1;
}

void (*static Float._vjpAdd(lhs:rhs:)())()
{
  return closure #1 in static Float16._vjpAdd(lhs:rhs:);
}

float (*static Float._jvpAdd(lhs:rhs:)())(float a1, float a2)
{
  return closure #1 in static Float._jvpAdd(lhs:rhs:);
}

float closure #1 in static Float._jvpAdd(lhs:rhs:)(float a1, float a2)
{
  return a1 + a2;
}

float (*static Float._vjpAddAssign(_:_:)(float *a1, float a2))(uint64_t a1)
{
  *a1 = *a1 + a2;
  return closure #1 in static Float._vjpAddAssign(_:_:);
}

float closure #1 in static Float._vjpAddAssign(_:_:)(uint64_t a1)
{
  return *(float *)a1;
}

float (*static Float._jvpAddAssign(_:_:)(float *a1, float a2))(float *a1, float a2)
{
  *a1 = *a1 + a2;
  return closure #1 in static Float._jvpAddAssign(_:_:);
}

float closure #1 in static Float._jvpAddAssign(_:_:)(float *a1, float a2)
{
  float result;

  result = *a1 + a2;
  *a1 = result;
  return result;
}

void (*static Float._vjpSubtract(lhs:rhs:)())()
{
  return closure #1 in static Float._vjpSubtract(lhs:rhs:);
}

float (*static Float._jvpSubtract(lhs:rhs:)())(float a1, float a2)
{
  return closure #1 in static Float._jvpSubtract(lhs:rhs:);
}

float closure #1 in static Float._jvpSubtract(lhs:rhs:)(float a1, float a2)
{
  return a1 - a2;
}

float (*static Float._vjpSubtractAssign(_:_:)(float *a1, float a2))(float *a1)
{
  *a1 = *a1 - a2;
  return closure #1 in static Float._vjpSubtractAssign(_:_:);
}

float closure #1 in static Float._vjpSubtractAssign(_:_:)(float *a1)
{
  return -*a1;
}

float (*static Float._jvpSubtractAssign(_:_:)(float *a1, float a2))(float *a1, float a2)
{
  *a1 = *a1 - a2;
  return closure #1 in static Float._jvpSubtractAssign(_:_:);
}

float closure #1 in static Float._jvpSubtractAssign(_:_:)(float *a1, float a2)
{
  float result;

  result = *a1 - a2;
  *a1 = result;
  return result;
}

float static Float._vjpMultiply(lhs:rhs:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float reverse-mode derivative of static Float.* infix(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float static Float._jvpMultiply(lhs:rhs:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a1;
  *(float *)(v5 + 20) = a2;
  return v4;
}

float forward-mode derivative of static Float.* infix(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a1;
  *(float *)(v5 + 20) = a2;
  return v4;
}

float (*static Float._vjpMultiplyAssign(_:_:)(float *a1, float a2))(float *a1)
{
  float v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 * a2;
  return partial apply for closure #1 in static Float._vjpMultiplyAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float.*= infix(_:_:)(float *a1, float a2))()
{
  float v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 * a2;
  return closure #1 in static Float._vjpMultiplyAssign(_:_:)partial apply;
}

float (*static Float._jvpMultiplyAssign(_:_:)(float *a1, float a2))(float *a1, float a2)
{
  float v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 * a2;
  v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return partial apply for closure #1 in static Float._jvpMultiplyAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float.*= infix(_:_:)(float *a1, float a2))()
{
  float v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 * a2;
  v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return closure #1 in static Float._jvpMultiplyAssign(_:_:)partial apply;
}

float static Float._vjpDivide(lhs:rhs:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float reverse-mode derivative of static Float./ infix(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float static Float._jvpDivide(lhs:rhs:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float forward-mode derivative of static Float./ infix(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

uint64_t (*static Float._vjpDivideAssign(_:_:)(float *a1, float a2))()
{
  float v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Float._vjpDivideAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float./= infix(_:_:)(float *a1, float a2))()
{
  float v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Float._vjpDivideAssign(_:_:);
}

uint64_t (*static Float._jvpDivideAssign(_:_:)(float *a1, float a2))()
{
  float v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 / a2;
  v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return partial apply for closure #1 in static Float._jvpDivideAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float./= infix(_:_:)(float *a1, float a2))()
{
  float v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 / a2;
  v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return partial apply for closure #1 in static Float._jvpDivideAssign(_:_:);
}

Swift::Void __swiftcall Double.move(by:)(Swift::Double by)
{
  double *v1;

  *v1 = *v1 + by;
}

double protocol witness for Differentiable.move(by:) in conformance Double(double *a1)
{
  double *v1;
  double result;

  result = *a1 + *v1;
  *v1 = result;
  return result;
}

__int16 (*static Double._vjpInit(x:)(__n128 _Q0))@<H0>(double _D0@<D0>)
{
  __asm { FCVT            D0, H0 }
  return closure #1 in static Double._vjpInit(x:);
}

__int16 closure #1 in static Double._vjpInit(x:)@<H0>(double _D0@<D0>)
{
  __int16 result;

  __asm { FCVT            H0, D0 }
  return result;
}

double (*static Double._jvpInit(x:)(__n128 _Q0))(__n128 _Q0)
{
  __asm { FCVT            D0, H0 }
  return closure #1 in static Double._jvpInit(x:);
}

double closure #1 in static Double._jvpInit(x:)(__n128 _Q0)
{
  double result;

  __asm { FCVT            D0, H0 }
  return result;
}

float (*static Double._vjpInit(x:)())(double a1)
{
  return closure #1 in static Double._vjpInit(x:);
}

float closure #1 in static Double._vjpInit(x:)(double a1)
{
  return a1;
}

double (*static Double._jvpInit(x:)())(float a1)
{
  return closure #1 in static Double._jvpInit(x:);
}

double closure #1 in static Double._jvpInit(x:)(float a1)
{
  return a1;
}

uint64_t (*static Double._vjpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Double._jvpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Double._vjpNegate(x:)())()
{
  return closure #1 in static Double._vjpNegate(x:);
}

double (*static Double._jvpNegate(x:)())(double a1)
{
  return closure #1 in static Double._jvpNegate(x:);
}

double closure #1 in static Double._jvpNegate(x:)(double a1)
{
  return -a1;
}

void (*static Double._vjpAdd(lhs:rhs:)())()
{
  return closure #1 in static Double._vjpAdd(lhs:rhs:);
}

double (*static Double._jvpAdd(lhs:rhs:)())(double a1, double a2)
{
  return closure #1 in static Double._jvpAdd(lhs:rhs:);
}

double closure #1 in static Double._jvpAdd(lhs:rhs:)(double a1, double a2)
{
  return a1 + a2;
}

double (*static Double._vjpAddAssign(_:_:)(double *a1, double a2))(uint64_t a1)
{
  *a1 = *a1 + a2;
  return closure #1 in static Double._vjpAddAssign(_:_:);
}

double closure #1 in static Double._vjpAddAssign(_:_:)(uint64_t a1)
{
  return *(double *)a1;
}

double (*static Double._jvpAddAssign(_:_:)(double *a1, double a2))(double *a1, double a2)
{
  *a1 = *a1 + a2;
  return closure #1 in static Double._jvpAddAssign(_:_:);
}

double closure #1 in static Double._jvpAddAssign(_:_:)(double *a1, double a2)
{
  double result;

  result = *a1 + a2;
  *a1 = result;
  return result;
}

void (*static Double._vjpSubtract(lhs:rhs:)())()
{
  return closure #1 in static Double._vjpSubtract(lhs:rhs:);
}

double (*static Double._jvpSubtract(lhs:rhs:)())(double a1, double a2)
{
  return closure #1 in static Double._jvpSubtract(lhs:rhs:);
}

double closure #1 in static Double._jvpSubtract(lhs:rhs:)(double a1, double a2)
{
  return a1 - a2;
}

double (*static Double._vjpSubtractAssign(_:_:)(double *a1, double a2))(double *a1)
{
  *a1 = *a1 - a2;
  return closure #1 in static Double._vjpSubtractAssign(_:_:);
}

double closure #1 in static Double._vjpSubtractAssign(_:_:)(double *a1)
{
  return -*a1;
}

double (*static Double._jvpSubtractAssign(_:_:)(double *a1, double a2))(double *a1, double a2)
{
  *a1 = *a1 - a2;
  return closure #1 in static Double._jvpSubtractAssign(_:_:);
}

double closure #1 in static Double._jvpSubtractAssign(_:_:)(double *a1, double a2)
{
  double result;

  result = *a1 - a2;
  *a1 = result;
  return result;
}

double static Double._vjpMultiply(lhs:rhs:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double reverse-mode derivative of static Double.* infix(_:_:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double static Double._jvpMultiply(lhs:rhs:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  return v4;
}

double forward-mode derivative of static Double.* infix(_:_:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 * a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  return v4;
}

double (*static Double._vjpMultiplyAssign(_:_:)(double *a1, double a2))(double *a1)
{
  double v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 * a2;
  return partial apply for closure #1 in static Double._vjpMultiplyAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Double.*= infix(_:_:)(double *a1, double a2))()
{
  double v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 * a2;
  return closure #1 in static Double._vjpMultiplyAssign(_:_:)partial apply;
}

double (*static Double._jvpMultiplyAssign(_:_:)(double *a1, double a2))(double *a1, double a2)
{
  double v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 * a2;
  v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return partial apply for closure #1 in static Double._jvpMultiplyAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Double.*= infix(_:_:)(double *a1, double a2))()
{
  double v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 * a2;
  v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return closure #1 in static Double._jvpMultiplyAssign(_:_:)partial apply;
}

double static Double._vjpDivide(lhs:rhs:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double reverse-mode derivative of static Double./ infix(_:_:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double static Double._jvpDivide(lhs:rhs:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double forward-mode derivative of static Double./ infix(_:_:)(double a1, double a2)
{
  double v4;
  uint64_t v5;

  v4 = a1 / a2;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

uint64_t (*static Double._vjpDivideAssign(_:_:)(double *a1, double a2))()
{
  double v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Double._vjpDivideAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Double./= infix(_:_:)(double *a1, double a2))()
{
  double v4;
  uint64_t v5;

  v4 = *a1;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Double._vjpDivideAssign(_:_:);
}

uint64_t (*static Double._jvpDivideAssign(_:_:)(double *a1, double a2))()
{
  double v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 / a2;
  v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return partial apply for closure #1 in static Double._jvpDivideAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Double./= infix(_:_:)(double *a1, double a2))()
{
  double v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = *a1 / a2;
  v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return partial apply for closure #1 in static Double._jvpDivideAssign(_:_:);
}

uint64_t (*FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v24;

  v11 = *(_QWORD *)(a4 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - v15;
  dispatch thunk of FloatingPoint.addingProduct(_:_:)();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v17(v16, a3, a4);
  v17(v14, a2, a4);
  v18 = *(unsigned __int8 *)(v11 + 80);
  v19 = (v18 + 40) & ~v18;
  v20 = (v12 + v18 + v19) & ~v18;
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = a4;
  *((_QWORD *)v21 + 3) = a5;
  *((_QWORD *)v21 + 4) = a6;
  v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v22(&v21[v19], v16, a4);
  v22(&v21[v20], v14, a4);
  return partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:);
}

uint64_t closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 16))(a1, a4, a7);
  dispatch thunk of static Numeric.* infix(_:_:)();
  return dispatch thunk of static Numeric.* infix(_:_:)();
}

uint64_t (*reverse-mode derivative of FloatingPoint.addingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  FloatingPoint<>._vjpAddingProduct(_:_:)(a1, a2, a3, a4, a5, a6);
  v10 = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a6;
  v11[5] = partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:);
  v11[6] = v10;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out A, @out A, @out A);
}

uint64_t (*FloatingPoint<>._vjpSquareRoot()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  unint64_t v15;
  char *v16;
  uint64_t v18;

  v8 = *(_QWORD *)(a2 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - v12;
  dispatch thunk of FloatingPoint.squareRoot()();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a1, v13, a2);
  v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v14(v11, v13, a2);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = a2;
  *((_QWORD *)v16 + 3) = a3;
  *((_QWORD *)v16 + 4) = a4;
  v14(&v16[v15], v11, a2);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*reverse-mode derivative of FloatingPoint.squareRoot()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  FloatingPoint<>._vjpSquareRoot()(a1, a2, a3, a4);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*static FloatingPoint<>._vjpMinimum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))()
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t (*v17)();
  char v18;
  _QWORD *v19;
  uint64_t v21;

  v12 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = dispatch thunk of static Comparable.<= infix(_:_:)();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v16(v14, a3, a4);
  if ((v15 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    v17 = partial apply for closure #1 in static FloatingPoint<>._vjpMinimum(_:_:);
  }
  else
  {
    v18 = dispatch thunk of FloatingPoint.isNaN.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    if ((v18 & 1) != 0)
    {
      v17 = partial apply for closure #1 in static FloatingPoint<>._vjpMinimum(_:_:);
    }
    else
    {
      a2 = a3;
      v17 = partial apply for closure #2 in static FloatingPoint<>._vjpMinimum(_:_:);
    }
  }
  v16(a1, a2, a4);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a4;
  v19[3] = a5;
  v19[4] = a6;
  return v17;
}

uint64_t (*reverse-mode derivative of static FloatingPoint.minimum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))()
{
  return static FloatingPoint<>._vjpMinimum(_:_:)(a1, a2, a3, a4, a5, a6);
}

uint64_t (*static FloatingPoint<>._vjpMaximum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  char v18;
  _QWORD *v19;
  uint64_t v21;

  v12 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = dispatch thunk of static Comparable.> infix(_:_:)();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v16(v14, a3, a4);
  if ((v15 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    v17 = partial apply for closure #1 in static FloatingPoint<>._vjpMaximum(_:_:);
  }
  else
  {
    v18 = dispatch thunk of FloatingPoint.isNaN.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    if ((v18 & 1) != 0)
    {
      v17 = partial apply for closure #1 in static FloatingPoint<>._vjpMaximum(_:_:);
    }
    else
    {
      a2 = a3;
      v17 = partial apply for closure #2 in static FloatingPoint<>._vjpMaximum(_:_:);
    }
  }
  v16(a1, a2, a4);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a4;
  v19[3] = a5;
  v19[4] = a6;
  return v17;
}

uint64_t closure #1 in static FloatingPoint<>._vjpMinimum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(a1, a3, a4);
  swift_getAssociatedConformanceWitness();
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t closure #2 in static FloatingPoint<>._vjpMinimum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(a2, a3, a4);
}

uint64_t (*reverse-mode derivative of static FloatingPoint.maximum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static FloatingPoint<>._vjpMaximum(_:_:)(a1, a2, a3, a4, a5, a6);
}

uint64_t (*_jvpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v25;

  v12 = *(_QWORD *)(a5 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v25 - v16;
  dispatch thunk of FloatingPoint.addingProduct(_:_:)();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v18(v17, a3, a5);
  v18(v15, a2, a5);
  v19 = *(unsigned __int8 *)(v12 + 80);
  v20 = (v19 + 40) & ~v19;
  v21 = (v13 + v19 + v20) & ~v19;
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = a5;
  *((_QWORD *)v22 + 3) = a6;
  *((_QWORD *)v22 + 4) = a7;
  v23 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v23(&v22[v20], v17, a5);
  v23(&v22[v21], v15, a5);
  return partial apply for closure #1 in _jvpFma<A>(_:_:_:);
}

uint64_t closure #1 in _jvpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t AssociatedConformanceWitness;
  void (*v17)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v20 = a3;
  v7 = *(_QWORD *)(a6 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v19 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - v14;
  dispatch thunk of static Numeric.* infix(_:_:)();
  dispatch thunk of static Numeric.* infix(_:_:)();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FF9FC](v13, v10, a6, AssociatedConformanceWitness);
  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, a6);
  v17(v13, a6);
  MEMORY[0x2199FF9FC](v15, v20, a6, AssociatedConformanceWitness);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, a6);
}

uint64_t (*forward-mode derivative of fma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _jvpFma<A>(_:_:_:)(a1, a2, a3, a4, a5, a6, a7);
  return partial apply for closure #1 in _jvpFma<A>(_:_:_:);
}

uint64_t (*_vjpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v25;

  v12 = *(_QWORD *)(a5 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v25 - v16;
  dispatch thunk of FloatingPoint.addingProduct(_:_:)();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v18(v17, a3, a5);
  v18(v15, a2, a5);
  v19 = *(unsigned __int8 *)(v12 + 80);
  v20 = (v19 + 40) & ~v19;
  v21 = (v13 + v19 + v20) & ~v19;
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = a5;
  *((_QWORD *)v22 + 3) = a6;
  *((_QWORD *)v22 + 4) = a7;
  v23 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v23(&v22[v20], v17, a5);
  v23(&v22[v21], v15, a5);
  return partial apply for closure #1 in _vjpFma<A>(_:_:_:);
}

uint64_t closure #1 in _vjpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  dispatch thunk of static Numeric.* infix(_:_:)();
  dispatch thunk of static Numeric.* infix(_:_:)();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 16))(a3, a4, a7);
}

uint64_t (*reverse-mode derivative of fma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _vjpFma<A>(_:_:_:)(a1, a2, a3, a4, a5, a6, a7);
  return partial apply for closure #1 in _vjpFma<A>(_:_:_:);
}

void _jvpRemainder<A>(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of remainder<A>(_:_:)()
{
  _jvpRemainder<A>(_:_:)();
}

uint64_t (*_vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v24;

  v11 = *(_QWORD *)(a4 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - v15;
  dispatch thunk of FloatingPoint.remainder(dividingBy:)();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v17(v16, a2, a4);
  v17(v14, a3, a4);
  v18 = *(unsigned __int8 *)(v11 + 80);
  v19 = (v18 + 40) & ~v18;
  v20 = (v12 + v18 + v19) & ~v18;
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = a4;
  *((_QWORD *)v21 + 3) = a5;
  *((_QWORD *)v21 + 4) = a6;
  v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v22(&v21[v19], v16, a4);
  v22(&v21[v20], v14, a4);
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:);
}

uint64_t (*reverse-mode derivative of remainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _vjpRemainder<A>(_:_:)(a1, a2, a3, a4, a5, a6);
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:);
}

void _jvpFmod<A>(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of fmod<A>(_:_:)()
{
  _jvpFmod<A>(_:_:)();
}

uint64_t (*_vjpFmod<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v24;

  v11 = *(_QWORD *)(a4 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - v15;
  dispatch thunk of FloatingPoint.truncatingRemainder(dividingBy:)();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v17(v16, a2, a4);
  v17(v14, a3, a4);
  v18 = *(unsigned __int8 *)(v11 + 80);
  v19 = (v18 + 40) & ~v18;
  v20 = (v12 + v18 + v19) & ~v18;
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = a4;
  *((_QWORD *)v21 + 3) = a5;
  *((_QWORD *)v21 + 4) = a6;
  v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v22(&v21[v19], v16, a4);
  v22(&v21[v20], v14, a4);
  return partial apply for closure #1 in _vjpFmod<A>(_:_:);
}

uint64_t closure #1 in _vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int *a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, _QWORD, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a4;
  v35 = a5;
  v36 = a2;
  v33 = type metadata accessor for FloatingPointRoundingRule();
  v13 = *(_QWORD *)(v33 - 8);
  v14 = MEMORY[0x24BDAC7A8](v33);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = *(_QWORD *)(a6 - 8);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v31 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v31 - v23;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(a1, a3, a6);
  MEMORY[0x2199FF9A8](a3, a6, *(_QWORD *)(a7 + 16));
  dispatch thunk of static FloatingPoint./ infix(_:_:)();
  v26 = *(void (**)(char *, _QWORD, uint64_t))(v13 + 104);
  v27 = v13;
  v28 = v33;
  v26(v16, *a9, v33);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v28);
  v29 = *(void (**)(char *, uint64_t))(v32 + 8);
  v29(v19, a6);
  dispatch thunk of static Numeric.* infix(_:_:)();
  v29(v22, a6);
  return ((uint64_t (*)(char *, uint64_t))v29)(v24, a6);
}

uint64_t (*reverse-mode derivative of fmod<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _vjpFmod<A>(_:_:)(a1, a2, a3, a4, a5, a6);
  return partial apply for closure #1 in _vjpFmod<A>(_:_:);
}

uint64_t (*_jvpSqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  unint64_t v16;
  char *v17;
  uint64_t v19;

  v9 = *(_QWORD *)(a3 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - v13;
  dispatch thunk of FloatingPoint.squareRoot()();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a1, v14, a3);
  v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v15(v12, v14, a3);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = a3;
  *((_QWORD *)v17 + 3) = a4;
  *((_QWORD *)v17 + 4) = a5;
  v15(&v17[v16], v12, a3);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*forward-mode derivative of sqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _jvpSqrt<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*_jvpCeil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38E0], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpCeil<A>(_:);
}

uint64_t (*forward-mode derivative of ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  _jvpCeil<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpCeil<A>(_:);
}

uint64_t (*_jvpFloor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38E8], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*forward-mode derivative of floor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _jvpFloor<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_jvpRound<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38D0], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*forward-mode derivative of round<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _jvpRound<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_jvpTrunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38B8], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*forward-mode derivative of trunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _jvpTrunc<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpSqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  unint64_t v16;
  char *v17;
  uint64_t v19;

  v9 = *(_QWORD *)(a3 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - v13;
  dispatch thunk of FloatingPoint.squareRoot()();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a1, v14, a3);
  v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v15(v12, v14, a3);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = a3;
  *((_QWORD *)v17 + 3) = a4;
  *((_QWORD *)v17 + 4) = a5;
  v15(&v17[v16], v12, a3);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t closure #1 in FloatingPoint<>._vjpSquareRoot()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t AssociatedConformanceWitness;
  void (*v18)(char *, uint64_t);
  _QWORD v20[4];

  v20[1] = a2;
  v20[2] = a5;
  v20[3] = a1;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)v20 - v9;
  v11 = *(_QWORD *)(a3 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v20 - v15;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FFA5C](&unk_216C92768, 768, AssociatedTypeWitness, AssociatedConformanceWitness);
  MEMORY[0x2199FFA50](v10, a3, v6);
  dispatch thunk of static Numeric.* infix(_:_:)();
  v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v14, a3);
  dispatch thunk of static FloatingPoint./ infix(_:_:)();
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, a3);
}

uint64_t (*reverse-mode derivative of sqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _vjpSqrt<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*_vjpCeil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38E0], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*reverse-mode derivative of ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _vjpCeil<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpFloor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38E8], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*reverse-mode derivative of floor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _vjpFloor<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpRound<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38D0], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*reverse-mode derivative of round<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _vjpRound<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpTrunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = type metadata accessor for FloatingPointRoundingRule();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE38B8], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t closure #1 in _jvpCeil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v10 - v6;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
  return MEMORY[0x2199FFA50](v7, a2, v4);
}

uint64_t (*reverse-mode derivative of trunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  _vjpTrunc<A>(_:)(a1, a2, a3, a4, a5);
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

double _jvpFma(_:_:_:)(long double a1, long double a2, long double a3)
{
  double v5;
  uint64_t v6;

  v5 = fma(a1, a2, a3);
  v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

double fmaTJfSSSpSr(long double a1, long double a2, long double a3)
{
  double v5;
  uint64_t v6;

  v5 = fma(a1, a2, a3);
  v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

double _vjpFma(_:_:_:)(long double a1, long double a2, long double a3)
{
  double v5;
  uint64_t v6;

  v5 = fma(a1, a2, a3);
  v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

double fmaTJrSSSpSr(long double a1, long double a2, long double a3)
{
  double v5;
  uint64_t v6;

  v5 = fma(a1, a2, a3);
  v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

void _jvpRemainder(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void remainderTJfSSpSr()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

double _vjpRemainder(_:_:)(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = remainder(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

double remainderTJrSSpSr(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = remainder(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

void _jvpFmod(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void fmodTJfSSpSr()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

double _vjpFmod(_:_:)(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = fmod(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

double fmodTJrSSpSr(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = fmod(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

double _jvpSqrt(_:)(double a1)
{
  double v1;

  v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double sqrtTJfSpSr(double a1)
{
  double v1;

  v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double (*_jvpCeil(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double closure #1 in _jvpCeil(_:)()
{
  return 0.0;
}

double (*_jvpFloor(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_jvpRound(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_jvpTrunc(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double _vjpSqrt(_:)(double a1)
{
  double v1;

  v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double sqrtTJrSpSr(double a1)
{
  double v1;

  v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double (*_vjpCeil(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_vjpFloor(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_vjpRound(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_vjpTrunc(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

float _jvpExp(_:)(float a1)
{
  float v1;

  v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of exp(_:)(float a1)
{
  float v1;

  v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpExp2(_:)(float a1)
{
  float v1;

  v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of exp2(_:)(float a1)
{
  float v1;

  v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpLog(_:)(float a1)
{
  float v2;

  v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log(_:)(float a1)
{
  float v2;

  v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpLog10(_:)(float a1)
{
  float v2;

  v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log10(_:)(float a1)
{
  float v2;

  v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpLog2(_:)(float a1)
{
  float v2;

  v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log2(_:)(float a1)
{
  float v2;

  v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpSin(_:)(float a1)
{
  float v2;

  v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of sin(_:)(float a1)
{
  float v2;

  v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpCos(_:)(float a1)
{
  float v2;

  v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of cos(_:)(float a1)
{
  float v2;

  v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpTan(_:)(float a1)
{
  float v1;

  v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of tan(_:)(float a1)
{
  float v1;

  v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpAsin(_:)(float a1)
{
  float v2;

  v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of asin(_:)(float a1)
{
  float v2;

  v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAcos(_:)(float a1)
{
  float v2;

  v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of acos(_:)(float a1)
{
  float v2;

  v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAtan(_:)(float a1)
{
  float v2;

  v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of atan(_:)(float a1)
{
  float v2;

  v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpSinh(_:)(float a1)
{
  float v2;

  v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of sinh(_:)(float a1)
{
  float v2;

  v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpCosh(_:)(float a1)
{
  float v2;

  v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of cosh(_:)(float a1)
{
  float v2;

  v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpTanh(_:)(float a1)
{
  float v1;

  v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of tanh(_:)(float a1)
{
  float v1;

  v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpAsinh(_:)(float a1)
{
  float v2;

  v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of asinh(_:)(float a1)
{
  float v2;

  v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAcosh(_:)(float a1)
{
  float v2;

  v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of acosh(_:)(float a1)
{
  float v2;

  v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAtanh(_:)(float a1)
{
  float v2;

  v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of atanh(_:)(float a1)
{
  float v2;

  v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpExpm1(_:)(float a1)
{
  float v2;

  v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of expm1(_:)(float a1)
{
  float v2;

  v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpLog1p(_:)(float a1)
{
  float v2;

  v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log1p(_:)(float a1)
{
  float v2;

  v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpErf(_:)(float a1)
{
  float v2;

  v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of erf(_:)(float a1)
{
  float v2;

  v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpErfc(_:)(float a1)
{
  float v2;

  v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of erfc(_:)(float a1)
{
  float v2;

  v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpExp(_:)(long double a1)
{
  double v1;

  v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double forward-mode derivative of exp(_:)(long double a1)
{
  double v1;

  v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpExp2(_:)(long double a1)
{
  double v1;

  v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double forward-mode derivative of exp2(_:)(long double a1)
{
  double v1;

  v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpLog(_:)(long double a1)
{
  double v2;

  v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of log(_:)(long double a1)
{
  double v2;

  v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpLog10(_:)(long double a1)
{
  double v2;

  v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of log10(_:)(long double a1)
{
  double v2;

  v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpLog2(_:)(long double a1)
{
  double v2;

  v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of log2(_:)(long double a1)
{
  double v2;

  v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpSin(_:)(long double a1)
{
  double v2;

  v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of sin(_:)(long double a1)
{
  double v2;

  v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpCos(_:)(long double a1)
{
  double v2;

  v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of cos(_:)(long double a1)
{
  double v2;

  v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpTan(_:)(long double a1)
{
  double v1;

  v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanTJfSpSr(long double a1)
{
  double v1;

  v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpAsin(_:)(long double a1)
{
  double v2;

  v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinTJfSpSr(long double a1)
{
  double v2;

  v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAcos(_:)(long double a1)
{
  double v2;

  v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acosTJfSpSr(long double a1)
{
  double v2;

  v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAtan(_:)(long double a1)
{
  double v2;

  v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanTJfSpSr(long double a1)
{
  double v2;

  v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpSinh(_:)(long double a1)
{
  double v2;

  v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double sinhTJfSpSr(long double a1)
{
  double v2;

  v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpCosh(_:)(long double a1)
{
  double v2;

  v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double coshTJfSpSr(long double a1)
{
  double v2;

  v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpTanh(_:)(long double a1)
{
  double v1;

  v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanhTJfSpSr(long double a1)
{
  double v1;

  v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpAsinh(_:)(long double a1)
{
  double v2;

  v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinhTJfSpSr(long double a1)
{
  double v2;

  v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAcosh(_:)(long double a1)
{
  double v2;

  v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acoshTJfSpSr(long double a1)
{
  double v2;

  v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAtanh(_:)(long double a1)
{
  double v2;

  v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanhTJfSpSr(long double a1)
{
  double v2;

  v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpExpm1(_:)(long double a1)
{
  double v2;

  v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double expm1TJfSpSr(long double a1)
{
  double v2;

  v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpLog1p(_:)(long double a1)
{
  double v2;

  v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double log1pTJfSpSr(long double a1)
{
  double v2;

  v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpErf(_:)(long double a1)
{
  double v2;

  v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfTJfSpSr(long double a1)
{
  double v2;

  v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpErfc(_:)(long double a1)
{
  double v2;

  v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfcTJfSpSr(long double a1)
{
  double v2;

  v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpExp(_:)(float a1)
{
  float v1;

  v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of exp(_:)(float a1)
{
  float v1;

  v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpExp2(_:)(float a1)
{
  float v1;

  v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of exp2(_:)(float a1)
{
  float v1;

  v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpLog(_:)(float a1)
{
  float v2;

  v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log(_:)(float a1)
{
  float v2;

  v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpLog10(_:)(float a1)
{
  float v2;

  v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log10(_:)(float a1)
{
  float v2;

  v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpLog2(_:)(float a1)
{
  float v2;

  v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log2(_:)(float a1)
{
  float v2;

  v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpSin(_:)(float a1)
{
  float v2;

  v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of sin(_:)(float a1)
{
  float v2;

  v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpCos(_:)(float a1)
{
  float v2;

  v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of cos(_:)(float a1)
{
  float v2;

  v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpTan(_:)(float a1)
{
  float v1;

  v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of tan(_:)(float a1)
{
  float v1;

  v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpAsin(_:)(float a1)
{
  float v2;

  v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of asin(_:)(float a1)
{
  float v2;

  v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAcos(_:)(float a1)
{
  float v2;

  v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of acos(_:)(float a1)
{
  float v2;

  v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAtan(_:)(float a1)
{
  float v2;

  v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of atan(_:)(float a1)
{
  float v2;

  v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpSinh(_:)(float a1)
{
  float v2;

  v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of sinh(_:)(float a1)
{
  float v2;

  v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpCosh(_:)(float a1)
{
  float v2;

  v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of cosh(_:)(float a1)
{
  float v2;

  v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpTanh(_:)(float a1)
{
  float v1;

  v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of tanh(_:)(float a1)
{
  float v1;

  v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpAsinh(_:)(float a1)
{
  float v2;

  v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of asinh(_:)(float a1)
{
  float v2;

  v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAcosh(_:)(float a1)
{
  float v2;

  v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of acosh(_:)(float a1)
{
  float v2;

  v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAtanh(_:)(float a1)
{
  float v2;

  v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of atanh(_:)(float a1)
{
  float v2;

  v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpExpm1(_:)(float a1)
{
  float v2;

  v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of expm1(_:)(float a1)
{
  float v2;

  v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpLog1p(_:)(float a1)
{
  float v2;

  v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log1p(_:)(float a1)
{
  float v2;

  v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpErf(_:)(float a1)
{
  float v2;

  v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of erf(_:)(float a1)
{
  float v2;

  v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpErfc(_:)(float a1)
{
  float v2;

  v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of erfc(_:)(float a1)
{
  float v2;

  v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpExp(_:)(long double a1)
{
  double v1;

  v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double reverse-mode derivative of exp(_:)(long double a1)
{
  double v1;

  v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpExp2(_:)(long double a1)
{
  double v1;

  v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double reverse-mode derivative of exp2(_:)(long double a1)
{
  double v1;

  v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpLog(_:)(long double a1)
{
  double v2;

  v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of log(_:)(long double a1)
{
  double v2;

  v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpLog10(_:)(long double a1)
{
  double v2;

  v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of log10(_:)(long double a1)
{
  double v2;

  v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpLog2(_:)(long double a1)
{
  double v2;

  v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of log2(_:)(long double a1)
{
  double v2;

  v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpSin(_:)(long double a1)
{
  double v2;

  v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of sin(_:)(long double a1)
{
  double v2;

  v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpCos(_:)(long double a1)
{
  double v2;

  v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of cos(_:)(long double a1)
{
  double v2;

  v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpTan(_:)(long double a1)
{
  double v1;

  v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanTJrSpSr(long double a1)
{
  double v1;

  v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpAsin(_:)(long double a1)
{
  double v2;

  v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinTJrSpSr(long double a1)
{
  double v2;

  v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAcos(_:)(long double a1)
{
  double v2;

  v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acosTJrSpSr(long double a1)
{
  double v2;

  v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAtan(_:)(long double a1)
{
  double v2;

  v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanTJrSpSr(long double a1)
{
  double v2;

  v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpSinh(_:)(long double a1)
{
  double v2;

  v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double sinhTJrSpSr(long double a1)
{
  double v2;

  v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpCosh(_:)(long double a1)
{
  double v2;

  v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double coshTJrSpSr(long double a1)
{
  double v2;

  v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpTanh(_:)(long double a1)
{
  double v1;

  v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanhTJrSpSr(long double a1)
{
  double v1;

  v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpAsinh(_:)(long double a1)
{
  double v2;

  v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinhTJrSpSr(long double a1)
{
  double v2;

  v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAcosh(_:)(long double a1)
{
  double v2;

  v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acoshTJrSpSr(long double a1)
{
  double v2;

  v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAtanh(_:)(long double a1)
{
  double v2;

  v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanhTJrSpSr(long double a1)
{
  double v2;

  v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpExpm1(_:)(long double a1)
{
  double v2;

  v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double expm1TJrSpSr(long double a1)
{
  double v2;

  v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpLog1p(_:)(long double a1)
{
  double v2;

  v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double log1pTJrSpSr(long double a1)
{
  double v2;

  v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpErf(_:)(long double a1)
{
  double v2;

  v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfTJrSpSr(long double a1)
{
  double v2;

  v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpErfc(_:)(long double a1)
{
  double v2;

  v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfcTJrSpSr(long double a1)
{
  double v2;

  v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpPow(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = powf(a1, a2);
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

float reverse-mode derivative of pow(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = powf(a1, a2);
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

float _jvpPow(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = powf(a1, a2);
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

float forward-mode derivative of pow(_:_:)(float a1, float a2)
{
  float v4;
  uint64_t v5;

  v4 = powf(a1, a2);
  v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

double _vjpPow(_:_:)(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = pow(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

double powTJrSSpSr(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = pow(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

double _jvpPow(_:_:)(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = pow(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

double powTJfSSpSr(long double a1, long double a2)
{
  double v4;
  uint64_t v5;

  v4 = pow(a1, a2);
  v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return dispatch thunk of SIMDStorage.init()();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F68]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE40F0], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F70]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, char *, uint64_t, uint64_t);
  _QWORD v14[2];
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t, uint64_t);

  v14[1] = a2;
  v15 = *(_QWORD *)(a4 - 8);
  v16 = a5;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v14 - v10;
  MEMORY[0x24BDAC7A8](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v12 = v16;
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v15 + 16) + 8) + 8);
  ((void (*)(char *, char *, uint64_t))v16)(v11, v8, v5);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v12(v11, v8, v5, v15);
  return dispatch thunk of SIMDStorage.subscript.setter();
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE40F0], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t static SIMD<>.+= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(uint64_t);
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v8, a3);
}

uint64_t (*SIMD2<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 2)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD2<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 2)
    return dispatch thunk of SIMDStorage.subscript.setter();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD2.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD2<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD2<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD2<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 2)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD2<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD2<>._jvpSubscript(index:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;

  MEMORY[0x24BDAC7A8](a1);
  if (v1 >= 2)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD2.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD2<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD2<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SIMD2<A>) -> (@out A);
}

uint64_t (*SIMD2<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9;
  size_t v10;
  const void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*result)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 2)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v12 - v8;
  if (a2 >= 2)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x2199FFA50](v9, a3, v6);
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD2.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD2<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SIMD2<A>) -> (@out A);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD4<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F68], a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD4<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4180], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD4<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F70], a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(char *, char *, uint64_t, uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t, uint64_t);
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t, uint64_t);

  v20 = a2;
  v21 = a5;
  v19 = a6;
  v18 = *(_QWORD *)(a4 - 8);
  v7 = *(_QWORD *)(a3 + 16);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v17 - v12;
  MEMORY[0x24BDAC7A8](v11);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  v17[1] = a1;
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v18 + 16) + 8) + 8);
  v14 = v18;
  v15 = v21;
  v21(v13, v10, v7, v18);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v15(v13, v10, v7, v14);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v21(v13, v10, v7, v18);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v21(v13, v10, v7, v18);
  return dispatch thunk of SIMDStorage.subscript.setter();
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD4<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4180], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD4<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 4)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD4<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD4<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 4)
    return dispatch thunk of SIMDStorage.subscript.setter();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD4.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD4<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD4<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD4<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 4)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD4<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD4<>._jvpSubscript(index:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;

  MEMORY[0x24BDAC7A8](a1);
  if (v1 >= 4)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD4.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD4<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD4<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD4<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9;
  size_t v10;
  const void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*result)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 4)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v12 - v8;
  if (a2 >= 4)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x2199FFA50](v9, a3, v6);
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD4.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD4<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD8<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F68]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4198], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F70]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  uint64_t result;
  _QWORD v14[3];
  void (*v15)(char *, char *, uint64_t, _QWORD);

  v14[2] = a2;
  v15 = a5;
  v14[0] = *(_QWORD *)(a4 - 8);
  v14[1] = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v14 - v10;
  MEMORY[0x24BDAC7A8](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (i = 0; i != 8; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14[0] + 16) + 8) + 8));
    result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4198], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD8<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 8)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD8<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD8<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 8)
    return dispatch thunk of SIMDStorage.subscript.setter();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD8.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD8<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD8<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD8<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 8)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD8<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD8<>._jvpSubscript(index:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;

  MEMORY[0x24BDAC7A8](a1);
  if (v1 >= 8)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD8.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD8<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD8<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD8<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9;
  size_t v10;
  const void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*result)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 8)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v12 - v8;
  if (a2 >= 8)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x2199FFA50](v9, a3, v6);
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD8.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD8<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD16<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F68]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4438], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F70]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  uint64_t result;
  _QWORD v14[3];
  void (*v15)(char *, char *, uint64_t, _QWORD);

  v14[2] = a2;
  v15 = a5;
  v14[0] = *(_QWORD *)(a4 - 8);
  v14[1] = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v14 - v10;
  MEMORY[0x24BDAC7A8](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (i = 0; i != 16; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14[0] + 16) + 8) + 8));
    result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4438], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD16<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 0x10)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD16<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD16<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 0x10)
    return dispatch thunk of SIMDStorage.subscript.setter();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD16.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD16<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD16<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD16<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 0x10)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD16<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD16<>._jvpSubscript(index:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;

  MEMORY[0x24BDAC7A8](a1);
  if (v1 >= 0x10)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD16.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD16<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD16<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD16<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9;
  size_t v10;
  const void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*result)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 0x10)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v12 - v8;
  if (a2 >= 0x10)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x2199FFA50](v9, a3, v6);
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD16.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD16<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD32<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F68]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4450], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F70]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  uint64_t result;
  _QWORD v14[3];
  void (*v15)(char *, char *, uint64_t, _QWORD);

  v14[2] = a2;
  v15 = a5;
  v14[0] = *(_QWORD *)(a4 - 8);
  v14[1] = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v14 - v10;
  MEMORY[0x24BDAC7A8](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (i = 0; i != 32; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14[0] + 16) + 8) + 8));
    result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4450], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD32<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 0x20)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD32<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD32<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 0x20)
    return dispatch thunk of SIMDStorage.subscript.setter();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD32.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD32<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD32<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD32<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 0x20)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD32<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD32<>._jvpSubscript(index:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;

  MEMORY[0x24BDAC7A8](a1);
  if (v1 >= 0x20)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD32.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD32<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD32<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD32<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9;
  size_t v10;
  const void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*result)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 0x20)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v12 - v8;
  if (a2 >= 0x20)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x2199FFA50](v9, a3, v6);
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD32.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD32<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD64<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F68]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4468], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, _QWORD))MEMORY[0x24BEE2F70]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  uint64_t result;
  _QWORD v14[3];
  void (*v15)(char *, char *, uint64_t, _QWORD);

  v14[2] = a2;
  v15 = a5;
  v14[0] = *(_QWORD *)(a4 - 8);
  v14[1] = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v14 - v10;
  MEMORY[0x24BDAC7A8](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (i = 0; i != 64; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14[0] + 16) + 8) + 8));
    result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4468], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD64<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 0x40)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD64<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD64<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 0x40)
    return dispatch thunk of SIMDStorage.subscript.setter();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD64.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD64<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD64<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD64<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 0x40)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD64<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD64<>._jvpSubscript(index:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;

  MEMORY[0x24BDAC7A8](a1);
  if (v1 >= 0x40)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD64.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD64<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD64<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD64<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9;
  size_t v10;
  const void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*result)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 0x40)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v12 - v8;
  if (a2 >= 0x40)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x2199FFA50](v9, a3, v6);
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD64.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD64<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F68]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4120], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(a1, a2, a3, a4, (void (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE2F70]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t, uint64_t);
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v19 = a2;
  v6 = *(_QWORD *)(a4 - 8);
  v17 = a5;
  v18 = v6;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v16 - v12;
  MEMORY[0x24BDAC7A8](v11);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  v16 = a1;
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v14 = v17;
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v18 + 16) + 8) + 8);
  ((void (*)(char *, char *, uint64_t))v17)(v13, v10, v7);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v14(v13, v10, v7, v18);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v14(v13, v10, v7, v18);
  return dispatch thunk of SIMDStorage.subscript.setter();
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199FFD80](MEMORY[0x24BEE4120], a3);
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD3<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 3)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD3<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD3<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 3)
    return dispatch thunk of SIMDStorage.subscript.setter();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD3.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD3<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD3<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD3<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*result)(uint64_t);

  if (a2 >= 3)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD3<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD3<>._jvpSubscript(index:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;

  MEMORY[0x24BDAC7A8](a1);
  if (v1 >= 3)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD3.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD3<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD3<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD3<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9;
  size_t v10;
  const void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*result)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 3)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  _QWORD v12[2];

  v12[1] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) + 8) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v12 - v8;
  if (a2 >= 3)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x2199FFA5C](&unk_216C92760, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x2199FFA50](v9, a3, v6);
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD3.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  SIMD3<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  v9 = v8;
  v10 = (_QWORD *)swift_allocObject();
  v11 = *(_QWORD *)(a3 + 24);
  v10[2] = *(_QWORD *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*static SIMD<>._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v36 = a6;
  v37 = a8;
  v43 = a7;
  v41 = a3;
  v31[1] = a2;
  v34 = a1;
  v35 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v40 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v31 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v31 - v18;
  v33 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  v22 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v22 < 0)
  {
    result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v32 = a9;
    v42 = v21;
    v39 = v19;
    if (v22)
    {
      v23 = v13;
      v24 = 0;
      v38 = v22;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        MEMORY[0x2199FF9FC](v16, v23, AssociatedTypeWitness, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v43 + 16) + 16) + 8) + 8));
        v25 = *(void (**)(char *, uint64_t))(v40 + 8);
        v25(v23, AssociatedTypeWitness);
        v25(v16, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v24;
      }
      while (v38 != v24);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v34, v42, a4);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v35;
    v26[2] = a4;
    v26[3] = v27;
    v28 = v43;
    v26[4] = v36;
    v26[5] = v28;
    v29 = v32;
    v26[6] = v37;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*result)(uint64_t, uint64_t);
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v36 = a6;
  v37 = a8;
  v43 = a7;
  v41 = a3;
  v31[1] = a2;
  v34 = a1;
  v35 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v40 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v31 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v31 - v18;
  v33 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  v22 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v22 < 0)
  {
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v32 = a9;
    v42 = v21;
    v39 = v19;
    if (v22)
    {
      v23 = v13;
      v24 = 0;
      v38 = v22;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        MEMORY[0x2199FF9FC](v16, v23, AssociatedTypeWitness, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v43 + 16) + 16) + 8) + 8));
        v25 = *(void (**)(char *, uint64_t))(v40 + 8);
        v25(v23, AssociatedTypeWitness);
        v25(v16, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v24;
      }
      while (v38 != v24);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v34, v42, a4);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v35;
    v26[2] = a4;
    v26[3] = v27;
    v28 = v43;
    v26[4] = v36;
    v26[5] = v28;
    v29 = v32;
    v26[6] = v37;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*result)(char *, uint64_t, uint64_t);
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v36 = a6;
  v37 = a8;
  v43 = a7;
  v41 = a3;
  v31[1] = a2;
  v34 = a1;
  v35 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v40 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v31 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v31 - v18;
  v33 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  v22 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v22 < 0)
  {
    result = (uint64_t (*)(char *, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v32 = a9;
    v42 = v21;
    v39 = v19;
    if (v22)
    {
      v23 = v13;
      v24 = 0;
      v38 = v22;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v25 = *(void (**)(char *, uint64_t))(v40 + 8);
        v25(v23, AssociatedTypeWitness);
        v25(v16, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v24;
      }
      while (v38 != v24);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v34, v42, a4);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v35;
    v26[2] = a4;
    v26[3] = v27;
    v28 = v43;
    v26[4] = v36;
    v26[5] = v28;
    v29 = v32;
    v26[6] = v37;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t AssociatedConformanceWitness;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  void (*v48)(char *, uint64_t);
  uint64_t result;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v58 = a3;
  v59 = a2;
  v55 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v54 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v50 - v13;
  v14 = swift_getAssociatedTypeWitness();
  v56 = *(char **)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v51 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v50 = (char *)&v50 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v50 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v50 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v50 - v25;
  v57 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a9 + 16) + 16) + 8);
  v27 = *(_QWORD *)(v57 + 16);
  v28 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v50 - v29;
  v53 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v55, v58, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, v28, AssociatedConformanceWitness);
  MEMORY[0x2199FFA50](v30, v14, v27);
  v32 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v56 + 2);
  v55 = v26;
  v32(v24, v26, v14);
  v33 = v54;
  dispatch thunk of SIMDStorage.init()();
  v34 = v33;
  v35 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v35 < 0)
    goto LABEL_10;
  v36 = v35;
  v37 = v34;
  if (v35)
  {
    v38 = 0;
    do
    {
      v32(v21, v24, v14);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v38;
    }
    while (v36 != v38);
  }
  v39 = (void (*)(char *, uint64_t))*((_QWORD *)v56 + 1);
  v39(v24, v14);
  (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v52, v37, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v40 = AssociatedTypeWitness;
  v41 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v41 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v42 = (char *)v41;
    v39(v55, v14);
    v43 = v51;
    v44 = v52;
    v45 = v50;
    v55 = (char *)v39;
    v56 = v21;
    if (v42)
    {
      v46 = 0;
      v54 = v42;
      do
      {
        v47 = v44;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v48 = (void (*)(char *, uint64_t))v55;
        ((void (*)(char *, uint64_t))v55)(v43, v14);
        v48(v45, v14);
        dispatch thunk of SIMDStorage.subscript.setter();
        v44 = v47;
        ++v46;
      }
      while (v54 != v46);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v44, v40);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(char *a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*result)(uint64_t, uint64_t);
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v36 = a6;
  v37 = a8;
  v43 = a7;
  v41 = a3;
  v31[1] = a2;
  v34 = a1;
  v35 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v40 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v31 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v31 - v18;
  v33 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  v22 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v22 < 0)
  {
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v32 = a9;
    v42 = v21;
    v39 = v19;
    if (v22)
    {
      v23 = v13;
      v24 = 0;
      v38 = v22;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v25 = *(void (**)(char *, uint64_t))(v40 + 8);
        v25(v23, AssociatedTypeWitness);
        v25(v16, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v24;
      }
      while (v38 != v24);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v34, v42, a4);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v35;
    v26[2] = a4;
    v26[3] = v27;
    v28 = v43;
    v26[4] = v36;
    v26[5] = v28;
    v29 = v32;
    v26[6] = v37;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return a9(a1, a2, AssociatedTypeWitness, AssociatedConformanceWitness);
}

uint64_t (*forward-mode derivative of static SIMD<>.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpNegate(rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t AssociatedConformanceWitness;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*result)();
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;

  v64 = a7;
  v65 = a8;
  v62 = a5;
  v72 = a2;
  v60 = a1;
  v67 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v73 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v68 = (char *)&v56 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v66 = (char *)&v56 - v14;
  v61 = v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(char **)(AssociatedTypeWitness - 8);
  v18 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v59 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v58 = (char *)&v56 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v56 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v56 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v56 - v28;
  v63 = a6;
  v71 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a6 + 16) + 16) + 8);
  v30 = *(_QWORD *)(v71 + 16);
  v31 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v56 - v32;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, v31, AssociatedConformanceWitness);
  MEMORY[0x2199FFA50](v33, AssociatedTypeWitness, v30);
  v69 = v29;
  v70 = v17;
  v35 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v17 + 2);
  v35(v27, v29, AssociatedTypeWitness);
  v36 = v68;
  dispatch thunk of SIMDStorage.init()();
  v37 = v36;
  v38 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v38 < 0)
    goto LABEL_10;
  v39 = v38;
  if (v38)
  {
    v40 = 0;
    do
    {
      v35(v24, v27, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v39 != v40);
  }
  v41 = (void (*)(char *, uint64_t))*((_QWORD *)v70 + 1);
  v41(v27, AssociatedTypeWitness);
  v57 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v57(v66, v37, a3);
  dispatch thunk of SIMDStorage.init()();
  v42 = a3;
  v43 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v44 = (char *)v43;
    v41(v69, AssociatedTypeWitness);
    v45 = v66;
    v47 = v58;
    v46 = v59;
    v69 = (char *)v41;
    v70 = v24;
    if (v44)
    {
      v48 = 0;
      v68 = v44;
      do
      {
        v49 = v45;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v50 = (void (*)(char *, uint64_t))v69;
        ((void (*)(char *, uint64_t))v69)(v46, AssociatedTypeWitness);
        v50(v47, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        v45 = v49;
        ++v48;
      }
      while (v68 != v48);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v45, v42);
    v57(v60, v73, v42);
    v51 = (_QWORD *)swift_allocObject();
    v52 = v61;
    v51[2] = v42;
    v51[3] = v52;
    v53 = v63;
    v51[4] = v62;
    v51[5] = v53;
    v54 = v65;
    v51[6] = v64;
    v51[7] = v54;
    return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.- prefix(_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  static SIMD<>._vjpNegate(rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
}

uint64_t (*static SIMD<>._jvpNegate(rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t AssociatedConformanceWitness;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*result)();
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;

  v64 = a7;
  v65 = a8;
  v62 = a5;
  v72 = a2;
  v60 = a1;
  v67 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v73 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v68 = (char *)&v56 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v66 = (char *)&v56 - v14;
  v61 = v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(char **)(AssociatedTypeWitness - 8);
  v18 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v59 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v58 = (char *)&v56 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v56 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v56 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v56 - v28;
  v63 = a6;
  v71 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a6 + 16) + 16) + 8);
  v30 = *(_QWORD *)(v71 + 16);
  v31 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v56 - v32;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, v31, AssociatedConformanceWitness);
  MEMORY[0x2199FFA50](v33, AssociatedTypeWitness, v30);
  v69 = v29;
  v70 = v17;
  v35 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v17 + 2);
  v35(v27, v29, AssociatedTypeWitness);
  v36 = v68;
  dispatch thunk of SIMDStorage.init()();
  v37 = v36;
  v38 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v38 < 0)
    goto LABEL_10;
  v39 = v38;
  if (v38)
  {
    v40 = 0;
    do
    {
      v35(v24, v27, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v39 != v40);
  }
  v41 = (void (*)(char *, uint64_t))*((_QWORD *)v70 + 1);
  v41(v27, AssociatedTypeWitness);
  v57 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v57(v66, v37, a3);
  dispatch thunk of SIMDStorage.init()();
  v42 = a3;
  v43 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v44 = (char *)v43;
    v41(v69, AssociatedTypeWitness);
    v45 = v66;
    v47 = v58;
    v46 = v59;
    v69 = (char *)v41;
    v70 = v24;
    if (v44)
    {
      v48 = 0;
      v68 = v44;
      do
      {
        v49 = v45;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v50 = (void (*)(char *, uint64_t))v69;
        ((void (*)(char *, uint64_t))v69)(v46, AssociatedTypeWitness);
        v50(v47, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        v45 = v49;
        ++v48;
      }
      while (v68 != v48);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v45, v42);
    v57(v60, v73, v42);
    v51 = (_QWORD *)swift_allocObject();
    v52 = v61;
    v51[2] = v42;
    v51[3] = v52;
    v53 = v63;
    v51[4] = v62;
    v51[5] = v53;
    v54 = v65;
    v51[6] = v64;
    v51[7] = v54;
    return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpNegate(rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t AssociatedConformanceWitness;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  uint64_t result;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v52 = a1;
  v53 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v47 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v48 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v44 - v7;
  v8 = swift_getAssociatedTypeWitness();
  v9 = *(char **)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v44 = (char *)&v44 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v44 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v44 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v44 - v20;
  v51 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) + 16) + 8);
  v22 = *(_QWORD *)(v51 + 16);
  v23 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v44 - v24;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, v23, AssociatedConformanceWitness);
  MEMORY[0x2199FFA50](v25, v8, v22);
  v49 = v21;
  v50 = v9;
  v27 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v9 + 2);
  v27(v19, v21, v8);
  v28 = v48;
  dispatch thunk of SIMDStorage.init()();
  v29 = v28;
  v30 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v30 < 0)
    goto LABEL_10;
  v31 = v30;
  if (v30)
  {
    v32 = 0;
    do
    {
      v27(v16, v19, v8);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v32;
    }
    while (v31 != v32);
  }
  v33 = (void (*)(char *, uint64_t))*((_QWORD *)v50 + 1);
  v33(v19, v8);
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v29, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v34 = AssociatedTypeWitness;
  v35 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v35 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v36 = (char *)v35;
    v33(v49, v8);
    v37 = v45;
    v38 = v46;
    v39 = v44;
    v49 = (char *)v33;
    v50 = v16;
    if (v36)
    {
      v40 = 0;
      v48 = v36;
      do
      {
        v41 = v38;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v42 = (void (*)(char *, uint64_t))v49;
        ((void (*)(char *, uint64_t))v49)(v37, v8);
        v42(v39, v8);
        dispatch thunk of SIMDStorage.subscript.setter();
        v38 = v41;
        ++v40;
      }
      while (v48 != v40);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v38, v34);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.- prefix(_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  static SIMD<>._jvpNegate(rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
}

uint64_t (*static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v51 = a3;
  v52 = a7;
  v46 = a5;
  v47 = a6;
  v50 = a2;
  v44 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v41 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v41 = *(_QWORD *)(a4 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v45 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v42 = v21;
  v43 = (char *)&v41 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v41 - v22;
  dispatch thunk of SIMDStorage.init()();
  v24 = v23;
  v25 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v25 < 0)
  {
    result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v26 = v25;
    v48 = v9;
    v49 = v24;
    if (v25)
    {
      v27 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v28 = *(void (**)(char *, uint64_t))(v48 + 8);
        v28(v12, AssociatedTypeWitness);
        v28(v15, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v26 != v27);
    }
    v29 = v41;
    v30 = *(void (**)(uint64_t, char *, uint64_t))(v41 + 32);
    v30(v44, v49, a4);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
    v32 = v43;
    v31(v43, v51, a4);
    v33 = v45;
    v31(v45, v50, a4);
    v34 = *(unsigned __int8 *)(v29 + 80);
    v35 = (v34 + 48) & ~v34;
    v36 = (v42 + v34 + v35) & ~v34;
    v37 = (_QWORD *)swift_allocObject();
    v38 = v46;
    v37[2] = a4;
    v37[3] = v38;
    v39 = v52;
    v37[4] = v47;
    v37[5] = v39;
    v30((uint64_t)v37 + v35, v32, a4);
    v30((uint64_t)v37 + v36, v33, a4);
    return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t result;
  char *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v33 = a4;
  v34 = a5;
  v31 = a3;
  v36 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v28 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v37 = (char *)&v28 - v19;
  v29 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  v22 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v22 < 0)
    goto LABEL_10;
  v30 = a1;
  v38 = a9;
  v35 = v21;
  if (v22)
  {
    v23 = 0;
    v32 = v22;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v24 = *(void (**)(char *, uint64_t))(v39 + 8);
      v24(v14, AssociatedTypeWitness);
      v24(v17, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v23;
    }
    while (v32 != v23);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v30, v35, a6);
  dispatch thunk of SIMDStorage.init()();
  result = dispatch thunk of Sequence.underestimatedCount.getter();
  if (result < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (result)
  {
    v26 = 0;
    v35 = (char *)result;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v27 = *(void (**)(char *, uint64_t))(v39 + 8);
      v27(v14, AssociatedTypeWitness);
      v27(v17, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      result = (uint64_t)v35;
      ++v26;
    }
    while (v35 != v26);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7);
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v51 = a3;
  v52 = a7;
  v46 = a5;
  v47 = a6;
  v50 = a2;
  v44 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v41 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v41 = *(_QWORD *)(a4 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v45 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v42 = v21;
  v43 = (char *)&v41 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v41 - v22;
  dispatch thunk of SIMDStorage.init()();
  v24 = v23;
  v25 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v25 < 0)
  {
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v26 = v25;
    v48 = v9;
    v49 = v24;
    if (v25)
    {
      v27 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v28 = *(void (**)(char *, uint64_t))(v48 + 8);
        v28(v12, AssociatedTypeWitness);
        v28(v15, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v26 != v27);
    }
    v29 = v41;
    v30 = *(void (**)(uint64_t, char *, uint64_t))(v41 + 32);
    v30(v44, v49, a4);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
    v32 = v43;
    v31(v43, v50, a4);
    v33 = v45;
    v31(v45, v51, a4);
    v34 = *(unsigned __int8 *)(v29 + 80);
    v35 = (v34 + 48) & ~v34;
    v36 = (v42 + v34 + v35) & ~v34;
    v37 = (_QWORD *)swift_allocObject();
    v38 = v46;
    v37[2] = a4;
    v37[3] = v38;
    v39 = v52;
    v37[4] = v47;
    v37[5] = v39;
    v30((uint64_t)v37 + v35, v32, a4);
    v30((uint64_t)v37 + v36, v33, a4);
    return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  void (*v30)(_QWORD, _QWORD, _QWORD);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t AssociatedConformanceWitness;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t result;
  _QWORD v41[2];
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t AssociatedTypeWitness;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(_QWORD, _QWORD, _QWORD);
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;

  v57 = a6;
  v43 = a1;
  v44 = a5;
  v51 = a3;
  v41[1] = a2;
  v45 = a7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v56 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v47 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v41 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v41 - v14;
  v49 = *(_QWORD *)(a4 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v53 = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v42 = (char *)v41 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v41 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v48 = (char *)v41 - v23;
  dispatch thunk of SIMDStorage.init()();
  v24 = a4;
  v25 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v25 < 0)
    goto LABEL_10;
  v52 = (void (*)(_QWORD, _QWORD, _QWORD))v22;
  v55 = v15;
  v27 = AssociatedTypeWitness;
  v26 = v47;
  if (v25)
  {
    v28 = 0;
    v50 = v25;
    do
    {
      v54 = v28 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v29 = *(void (**)(char *, uint64_t))(v56 + 8);
      v29(v26, v27);
      v29(v12, v27);
      dispatch thunk of SIMDStorage.subscript.setter();
      v28 = v54;
    }
    while (v50 != v54);
  }
  v30 = v52;
  v52 = *(void (**)(_QWORD, _QWORD, _QWORD))(v49 + 32);
  v52(v48, v30, v24);
  dispatch thunk of SIMDStorage.init()();
  v31 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v31 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v32 = AssociatedTypeWitness;
    v33 = v47;
    if (v31)
    {
      v34 = 0;
      v54 = v31;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v35 = *(void (**)(char *, uint64_t))(v56 + 8);
        v35(v33, v32);
        v35(v12, v32);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v34;
      }
      while (v54 != v34);
    }
    v36 = v42;
    v52(v42, v53, v24);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v38 = v48;
    MEMORY[0x2199FF9FC](v48, v36, v24, AssociatedConformanceWitness);
    v39 = *(void (**)(char *, uint64_t))(v49 + 8);
    v39(v36, v24);
    return ((uint64_t (*)(char *, uint64_t))v39)(v38, v24);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7);
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v51 = a3;
  v52 = a7;
  v46 = a5;
  v47 = a6;
  v50 = a2;
  v44 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v41 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v41 = *(_QWORD *)(a4 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v45 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v42 = v21;
  v43 = (char *)&v41 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v41 - v22;
  dispatch thunk of SIMDStorage.init()();
  v24 = v23;
  v25 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v25 < 0)
  {
    result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v26 = v25;
    v48 = v9;
    v49 = v24;
    if (v25)
    {
      v27 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v28 = *(void (**)(char *, uint64_t))(v48 + 8);
        v28(v12, AssociatedTypeWitness);
        v28(v15, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v26 != v27);
    }
    v29 = v41;
    v30 = *(void (**)(uint64_t, char *, uint64_t))(v41 + 32);
    v30(v44, v49, a4);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
    v32 = v43;
    v31(v43, v51, a4);
    v33 = v45;
    v31(v45, v50, a4);
    v34 = *(unsigned __int8 *)(v29 + 80);
    v35 = (v34 + 48) & ~v34;
    v36 = (v42 + v34 + v35) & ~v34;
    v37 = (_QWORD *)swift_allocObject();
    v38 = v46;
    v37[2] = a4;
    v37[3] = v38;
    v39 = v52;
    v37[4] = v47;
    v37[5] = v39;
    v30((uint64_t)v37 + v35, v32, a4);
    v30((uint64_t)v37 + v36, v33, a4);
    return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(void (*a1)(_QWORD, _QWORD, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(_QWORD, _QWORD, _QWORD);
  uint64_t v51;
  uint64_t v52;
  uint64_t AssociatedConformanceWitness;
  char *v54;
  char *v55;
  void (*v56)(char *, char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  char *v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  void (*v87)(char *, uint64_t);
  uint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  void (*v95)(char *, uint64_t);
  uint64_t result;
  uint64_t v97;
  char *v98;
  uint64_t AssociatedTypeWitness;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  void (*v107)(_QWORD, _QWORD, _QWORD);
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  void (*v124)(char *, uint64_t);
  char *v125;

  v111 = a5;
  v113 = a4;
  v114 = a2;
  v115 = a3;
  v107 = a1;
  v121 = *(_QWORD *)(a9 + 16);
  v123 = *(_QWORD *)(*(_QWORD *)(v121 + 16) + 8);
  v10 = *(_QWORD *)(v123 + 16);
  v11 = *(_QWORD *)(a7 + 48);
  swift_getAssociatedTypeWitness();
  v100 = v10;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v98 = (char *)&v97 - v12;
  v13 = swift_checkMetadataState();
  v124 = *(void (**)(char *, uint64_t))(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v104 = (char *)&v97 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v109 = (char *)&v97 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v108 = (char *)&v97 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v125 = (char *)&v97 - v24;
  v105 = *(_QWORD *)(a6 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v119 = (char *)&v97 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v117 = (char *)&v97 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v118 = (char *)&v97 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v116 = (char *)&v97 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v97 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v103 = (char *)&v97 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v122 = (char *)&v97 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v106 = (char *)&v97 - v41;
  MEMORY[0x24BDAC7A8](v40);
  v43 = (char *)&v97 - v42;
  dispatch thunk of SIMDStorage.init()();
  v44 = v43;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
    goto LABEL_26;
  v101 = v35;
  v102 = v16;
  v47 = v108;
  v46 = v109;
  v112 = v44;
  v120 = v11;
  if (v45)
  {
    v48 = 0;
    v110 = v45;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      v49 = (void (*)(char *, uint64_t))*((_QWORD *)v124 + 1);
      v49(v46, v13);
      v49(v47, v13);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v48;
    }
    while (v110 != v48);
  }
  v50 = v107;
  v107 = *(void (**)(_QWORD, _QWORD, _QWORD))(v105 + 32);
  v107(v50, v112, a6);
  v51 = v100;
  v52 = AssociatedTypeWitness;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v54 = v98;
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, v52, AssociatedConformanceWitness);
  v55 = v104;
  MEMORY[0x2199FFA50](v54, v13, v51);
  v56 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v124 + 2);
  v56(v102, v55, v13);
  dispatch thunk of SIMDStorage.init()();
  v110 = a6;
  v57 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v57 < 0)
    goto LABEL_26;
  v58 = v57;
  v59 = v102;
  v60 = v101;
  v61 = v125;
  v62 = v110;
  if (v57)
  {
    v63 = 0;
    do
    {
      v56(v61, v59, v13);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v63;
    }
    while (v58 != v63);
  }
  v64 = (void (*)(char *, uint64_t))*((_QWORD *)v124 + 1);
  v64(v59, v13);
  v107(v103, v60, v62);
  dispatch thunk of SIMDStorage.init()();
  v65 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v65 < 0)
    goto LABEL_26;
  v66 = (char *)v65;
  v64(v104, v13);
  v124 = v64;
  v67 = v103;
  v69 = v108;
  v68 = v109;
  v70 = v110;
  if (v66)
  {
    v71 = 0;
    v112 = v66;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
      v72 = v124;
      v124(v68, v13);
      v72(v69, v13);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v71;
    }
    while (v112 != v71);
  }
  v112 = *(char **)(v105 + 8);
  ((void (*)(char *, uint64_t))v112)(v67, v70);
  v107(v122, v116, v70);
  dispatch thunk of SIMDStorage.init()();
  v73 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v73 < 0)
    goto LABEL_26;
  v74 = v108;
  v75 = v109;
  v76 = v110;
  if (v73)
  {
    v77 = 0;
    v116 = (char *)v73;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v78 = v124;
      v124(v75, v13);
      v78(v74, v13);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v77;
    }
    while (v116 != v77);
  }
  v107(v118, v117, v76);
  dispatch thunk of SIMDStorage.init()();
  v79 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v79 < 0)
    goto LABEL_26;
  v80 = v79;
  v81 = v122;
  v82 = v108;
  v83 = v109;
  v84 = v110;
  if (v79)
  {
    v85 = 0;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      v86 = v124;
      v124(v83, v13);
      v86(v82, v13);
      dispatch thunk of SIMDStorage.subscript.setter();
      v81 = v122;
      ++v85;
    }
    while (v80 != v85);
  }
  v87 = (void (*)(char *, uint64_t))v112;
  ((void (*)(char *, uint64_t))v112)(v118, v84);
  v87(v81, v84);
  v107(v106, v119, v84);
  dispatch thunk of SIMDStorage.init()();
  v88 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v88 < 0)
  {
LABEL_26:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v89 = v106;
    v90 = v108;
    v91 = v109;
    v92 = v110;
    if (v88)
    {
      v93 = 0;
      v122 = (char *)v88;
      do
      {
        v94 = v89;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v95 = v124;
        v124(v91, v13);
        v95(v90, v13);
        dispatch thunk of SIMDStorage.subscript.setter();
        v89 = v94;
        ++v93;
      }
      while (v122 != v93);
    }
    return ((uint64_t (*)(char *, uint64_t))v112)(v89, v92);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7);
  return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v51 = a3;
  v52 = a7;
  v46 = a5;
  v47 = a6;
  v50 = a2;
  v44 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v41 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v41 = *(_QWORD *)(a4 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v45 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v42 = v21;
  v43 = (char *)&v41 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v41 - v22;
  dispatch thunk of SIMDStorage.init()();
  v24 = v23;
  v25 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v25 < 0)
  {
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v26 = v25;
    v48 = v9;
    v49 = v24;
    if (v25)
    {
      v27 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v28 = *(void (**)(char *, uint64_t))(v48 + 8);
        v28(v12, AssociatedTypeWitness);
        v28(v15, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v26 != v27);
    }
    v29 = v41;
    v30 = *(void (**)(uint64_t, char *, uint64_t))(v41 + 32);
    v30(v44, v49, a4);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
    v32 = v43;
    v31(v43, v51, a4);
    v33 = v45;
    v31(v45, v50, a4);
    v34 = *(unsigned __int8 *)(v29 + 80);
    v35 = (v34 + 48) & ~v34;
    v36 = (v42 + v34 + v35) & ~v34;
    v37 = (_QWORD *)swift_allocObject();
    v38 = v46;
    v37[2] = a4;
    v37[3] = v38;
    v39 = v52;
    v37[4] = v47;
    v37[5] = v39;
    v30((uint64_t)v37 + v35, v32, a4);
    v30((uint64_t)v37 + v36, v33, a4);
    return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t (*v49)(char *, uint64_t);
  uint64_t result;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;

  v68 = a6;
  v53 = a3;
  v54 = a5;
  v60 = a2;
  v61 = a7;
  v58 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v67 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v51 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v51 - v16;
  v56 = *(_QWORD *)(a4 - 8);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v63 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v64 = (char *)&v51 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v62 = (char *)&v51 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v52 = (char *)&v51 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v51 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v55 = (char *)&v51 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v65 = (char *)&v51 - v31;
  dispatch thunk of SIMDStorage.init()();
  v32 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v32 < 0)
    goto LABEL_18;
  v59 = v28;
  v66 = v17;
  if (v32)
  {
    v33 = 0;
    v57 = (void (*)(char *, char *, uint64_t))v32;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v34 = *(void (**)(char *, uint64_t))(v67 + 8);
      v34(v11, AssociatedTypeWitness);
      v34(v14, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      v33 = (void (*)(char *, char *, uint64_t))((char *)v33 + 1);
    }
    while (v57 != v33);
  }
  v57 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
  v57(v55, v59, a4);
  dispatch thunk of SIMDStorage.init()();
  v35 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v35 < 0)
    goto LABEL_18;
  if (v35)
  {
    v36 = 0;
    v59 = (char *)v35;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v37 = *(void (**)(char *, uint64_t))(v67 + 8);
      v37(v11, AssociatedTypeWitness);
      v37(v14, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v36;
    }
    while (v59 != v36);
  }
  v38 = v52;
  v57(v52, v62, a4);
  swift_getAssociatedConformanceWitness();
  v39 = v55;
  dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  v40 = *(void (**)(char *, uint64_t))(v56 + 8);
  v40(v38, a4);
  v59 = (char *)v40;
  v40(v39, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v41 < 0)
    goto LABEL_18;
  if (v41)
  {
    v42 = 0;
    v62 = (char *)v41;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v43 = *(void (**)(char *, uint64_t))(v67 + 8);
      v43(v11, AssociatedTypeWitness);
      v43(v14, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v42;
    }
    while (v62 != v42);
  }
  v57(v64, v63, a4);
  dispatch thunk of SIMDStorage.init()();
  v44 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v44 < 0)
  {
LABEL_18:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v45 = v44;
    v46 = v65;
    if (v44)
    {
      v47 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v48 = *(void (**)(char *, uint64_t))(v67 + 8);
        v48(v11, AssociatedTypeWitness);
        v48(v14, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v65;
        ++v47;
      }
      while (v45 != v47);
    }
    v49 = (uint64_t (*)(char *, uint64_t))v59;
    ((void (*)(char *, uint64_t))v59)(v64, a4);
    return v49(v46, a4);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7);
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
}

uint64_t static SIMD<>._vjpAdd(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;

  v64 = a6;
  v65 = a8;
  v73 = a7;
  v71 = a3;
  v62 = a1;
  v63 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v66 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a2);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v72 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v66, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v66;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        MEMORY[0x2199FF9FC](v18, v47, v48, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v73 + 16) + 16) + 8) + 8));
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v46, v44);
    v61(v62, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v63;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v73;
    v52[4] = v64;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v65;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;

  v65 = a6;
  v66 = a8;
  v72 = a7;
  v62 = a2;
  v63 = a1;
  v64 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v73 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a3);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v71 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v73, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v62;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        MEMORY[0x2199FF9FC](v18, v47, v48, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v72 + 16) + 16) + 8) + 8));
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v73, v44);
    v61(v63, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v64;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v72;
    v52[4] = v65;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v66;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

uint64_t SIMD<>.sum()@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v13 - v6;
  v8 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 8);
  dispatch thunk of IteratorProtocol.next()();
  v16 = a2;
  MEMORY[0x2199FF9A8](v7, AssociatedTypeWitness, v8);
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v7, AssociatedTypeWitness);
  result = dispatch thunk of Sequence.underestimatedCount.getter();
  if (result < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v10 = result;
    v11 = v14;
    if (result)
    {
      result = 0;
      do
      {
        v12 = result + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+= infix(_:_:)();
        v11(v7, AssociatedTypeWitness);
        result = v12;
      }
      while (v10 != v12);
    }
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.+ infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
}

{
  static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
}

uint64_t static SIMD<>._jvpAdd(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;

  v64 = a6;
  v65 = a8;
  v73 = a7;
  v71 = a3;
  v62 = a1;
  v63 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v66 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a2);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v72 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v66, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v66;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        MEMORY[0x2199FF9FC](v18, v47, v48, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v73 + 16) + 16) + 8) + 8));
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v46, v44);
    v61(v62, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v63;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v73;
    v52[4] = v64;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v65;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;

  v65 = a6;
  v66 = a8;
  v72 = a7;
  v62 = a2;
  v63 = a1;
  v64 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v73 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a3);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v71 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v73, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v62;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        MEMORY[0x2199FF9FC](v18, v47, v48, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v72 + 16) + 16) + 8) + 8));
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v73, v44);
    v61(v63, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v64;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v72;
    v52[4] = v65;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v66;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.+ infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
}

{
  static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
}

uint64_t static SIMD<>._vjpSubtract(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;

  v64 = a6;
  v65 = a8;
  v73 = a7;
  v71 = a3;
  v62 = a1;
  v63 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v66 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a2);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v72 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v66, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v66;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v46, v44);
    v61(v62, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v63;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v73;
    v52[4] = v64;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v65;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;

  v65 = a6;
  v66 = a8;
  v72 = a7;
  v62 = a2;
  v63 = a1;
  v64 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v73 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a3);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v71 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v73, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v62;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v73, v44);
    v61(v63, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v64;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v72;
    v52[4] = v65;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v66;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t AssociatedConformanceWitness;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  uint64_t result;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v63 = a3;
  v64 = a2;
  v59 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v57 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v56 = (char *)&v53 - v14;
  v61 = swift_getAssociatedTypeWitness();
  v62 = a8;
  v15 = swift_getAssociatedTypeWitness();
  v60 = *(char **)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v55 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v54 = (char *)&v53 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v53 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v53 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v53 - v26;
  v28 = *(_QWORD *)(a10 + 16);
  v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v28 + 16) + 8) + 16);
  v30 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v53 - v31;
  SIMD<>.sum()(v28, (uint64_t)v59);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, v30, AssociatedConformanceWitness);
  MEMORY[0x2199FFA50](v32, v15, v29);
  v34 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v60 + 2);
  v59 = v27;
  v34(v25, v27, v15);
  v35 = v58;
  dispatch thunk of SIMDStorage.init()();
  v36 = v35;
  v37 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v37 < 0)
    goto LABEL_10;
  v38 = v37;
  v39 = v36;
  if (v37)
  {
    v40 = 0;
    do
    {
      v34(v22, v25, v15);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v38 != v40);
  }
  v41 = v22;
  v42 = (void (*)(char *, uint64_t))*((_QWORD *)v60 + 1);
  v42(v25, v15);
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v56, v39, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v43 = AssociatedTypeWitness;
  v44 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v44 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v45 = (char *)v44;
    v42(v59, v15);
    v47 = v55;
    v46 = v56;
    v48 = v54;
    v59 = (char *)v42;
    v60 = v41;
    if (v45)
    {
      v49 = 0;
      v58 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        swift_getAssociatedConformanceWitness();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v51 = (void (*)(char *, uint64_t))v59;
        ((void (*)(char *, uint64_t))v59)(v47, v15);
        v51(v48, v15);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v58 != v49);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v46, v43);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.- infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
}

{
  static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
}

uint64_t static SIMD<>._jvpSubtract(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;

  v64 = a6;
  v65 = a8;
  v73 = a7;
  v71 = a3;
  v62 = a1;
  v63 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v66 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a2);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v72 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v66, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v66;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v46, v44);
    v61(v62, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v63;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v73;
    v52[4] = v64;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v65;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;

  v65 = a6;
  v66 = a8;
  v72 = a7;
  v62 = a2;
  v63 = a1;
  v64 = a5;
  v12 = *(_QWORD *)(a5 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v58 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v57 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v67 = *(_QWORD *)(a4 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v57 - v22);
  v74 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v57 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v73 = (char *)&v57 - v29;
  v31 = (char *)*((_QWORD *)v30 + 2);
  v32 = v28;
  v34 = v33;
  v69 = v30;
  v70 = v31;
  ((void (*)(uint64_t, uint64_t))v31)(v28, a3);
  dispatch thunk of SIMDStorage.init()();
  v57 = a4;
  v35 = v12;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_10;
  v37 = v36;
  v38 = (void (*)(char *, uint64_t, uint64_t))v70;
  v71 = v35;
  v39 = v57;
  if (v36)
  {
    v40 = 0;
    do
    {
      v38(v21, v32, v34);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v37 != v40);
  }
  v70 = v21;
  v41 = v32;
  v42 = v34;
  v43 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v69 + 1);
  v43(v41, v34);
  v61 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
  v61(v73, v27, v39);
  dispatch thunk of SIMDStorage.init()();
  v44 = v39;
  v45 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v59 = a9;
    v60 = a10;
    v46 = v62;
    v47 = v58;
    v69 = v43;
    if (v45)
    {
      v48 = v42;
      v49 = 0;
      v68 = v45;
      do
      {
        v50 = v46;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v51 = (void (*)(char *, uint64_t))v69;
        v69((uint64_t)v47, v48);
        v51(v18, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v46 = v50;
        ++v49;
      }
      while (v68 != v49);
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v73, v44);
    v61(v63, v74, v44);
    v52 = (_QWORD *)swift_allocObject();
    v53 = v64;
    v52[2] = v44;
    v52[3] = v53;
    v54 = v72;
    v52[4] = v65;
    v52[5] = v54;
    v55 = v59;
    v52[6] = v66;
    v52[7] = v55;
    result = (uint64_t)partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
    v52[8] = v60;
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X6>, void (*a4)(char *, uint64_t)@<X7>, uint64_t a5@<X8>, uint64_t a6, void (*a7)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t AssociatedTypeWitness;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;

  v53 = a4;
  v54 = a5;
  v51 = a2;
  v48 = a1;
  v52 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(char **)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v44 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v43 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v43 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v43 - v17;
  v19 = swift_getAssociatedTypeWitness();
  v46 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (void (*)(char *, uint64_t))((char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v20);
  v45 = (char *)&v43 - v23;
  v49 = v8;
  v24 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v8 + 2);
  v25 = v18;
  v26 = v24;
  v24(v18, (char *)v48, v7);
  dispatch thunk of SIMDStorage.init()();
  v27 = v22;
  v28 = v19;
  v29 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v29 < 0)
    goto LABEL_10;
  v53 = v27;
  if (v29)
  {
    v30 = 0;
    do
    {
      v31 = v29;
      v26(v16, v25, v7);
      dispatch thunk of SIMDStorage.subscript.setter();
      v29 = v31;
      ++v30;
    }
    while (v31 != v30);
  }
  v32 = v16;
  v33 = (void (*)(char *, uint64_t))*((_QWORD *)v49 + 1);
  v33(v25, v7);
  (*(void (**)(char *, void (*)(char *, uint64_t), uint64_t))(v46 + 32))(v45, v53, v28);
  dispatch thunk of SIMDStorage.init()();
  v34 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v34 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v36 = v44;
    v35 = v45;
    v53 = v33;
    v49 = v32;
    v37 = v28;
    if (v34)
    {
      v38 = 0;
      v47 = a7;
      v48 = v34;
      v39 = v53;
      do
      {
        v40 = v35;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        v47(v13, v36, v7, AssociatedConformanceWitness);
        v39(v36, v7);
        v39(v13, v7);
        dispatch thunk of SIMDStorage.subscript.setter();
        v35 = v40;
        ++v38;
      }
      while (v48 != v38);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v35, v37);
  }
  return result;
}

{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t, uint64_t);
  uint64_t v49;
  char *v50;
  uint64_t AssociatedTypeWitness;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  char *v55;

  v53 = a4;
  v54 = a5;
  v49 = a2;
  v46 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v52 = a3;
  v8 = swift_getAssociatedTypeWitness();
  v9 = *(char **)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v44 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v44 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v44 - v18;
  v20 = swift_getAssociatedTypeWitness();
  v47 = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (void (*)(char *, uint64_t))((char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v21);
  v55 = (char *)&v44 - v24;
  v50 = v9;
  v25 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v9 + 2);
  v26 = v19;
  v27 = v25;
  v25(v19, (char *)v49, v8);
  dispatch thunk of SIMDStorage.init()();
  v28 = v23;
  v29 = v20;
  v30 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v30 < 0)
    goto LABEL_10;
  v53 = v28;
  if (v30)
  {
    v31 = 0;
    do
    {
      v32 = v30;
      v27(v17, v26, v8);
      dispatch thunk of SIMDStorage.subscript.setter();
      v30 = v32;
      ++v31;
    }
    while (v32 != v31);
  }
  v33 = v17;
  v34 = (void (*)(char *, uint64_t))*((_QWORD *)v50 + 1);
  v34(v26, v8);
  (*(void (**)(char *, void (*)(char *, uint64_t), uint64_t))(v47 + 32))(v55, v53, v29);
  dispatch thunk of SIMDStorage.init()();
  v35 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v35 < 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v37 = v45;
    v36 = v46;
    v53 = v34;
    v50 = v33;
    v38 = v29;
    if (v35)
    {
      v39 = 0;
      v48 = a7;
      v49 = v35;
      v40 = v53;
      do
      {
        v41 = v36;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        v48(v14, v37, v8, AssociatedConformanceWitness);
        v40(v37, v8);
        v40(v14, v8);
        dispatch thunk of SIMDStorage.subscript.setter();
        v36 = v41;
        ++v39;
      }
      while (v49 != v39);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v55, v38);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.- infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
}

{
  static SIMD<>._jvpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
}

uint64_t closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v19[0] = a9;
  v19[1] = a2;
  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)v19 - v14;
  v16 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a3, v16);
  v17 = *(_QWORD *)(a10 + 16);
  SIMD<>.sum()(v17, (uint64_t)v15);
  MEMORY[0x2199FF9A8](v15, AssociatedTypeWitness, *(_QWORD *)(v17 + 16));
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
}

uint64_t (*static SIMD<>._vjpMultiply(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  char *v62;
  char *v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t);
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;

  v71 = a6;
  v72 = a8;
  v78 = a7;
  v81 = a2;
  v66 = a1;
  v70 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v63 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)&v61 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  v68 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v74 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v61 - v19);
  v67 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v80 = (char *)&v61 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v61 - v25;
  v65 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v79 = (char *)&v61 - v29;
  v75 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v69 = a3;
  v73 = v31;
  v31((char *)v28, a3, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v33 < 0)
    goto LABEL_10;
  v34 = v33;
  v35 = v73;
  if (v33)
  {
    v36 = 0;
    do
    {
      v35(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v36;
    }
    while (v34 != v36);
  }
  v37 = v17;
  v38 = AssociatedTypeWitness;
  v39 = AssociatedTypeWitness;
  v40 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
  v40(v32, v39);
  v64 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
  v64(v79, v26, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = a4;
  v42 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v42 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v43 = v42;
    v44 = v81;
    v45 = v62;
    v46 = v63;
    v76 = v40;
    v77 = v37;
    v47 = v38;
    if (v42)
    {
      v48 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v49 = (void (*)(char *, uint64_t))v76;
        v76((uint64_t)v46, v38);
        v49(v45, v38);
        dispatch thunk of SIMDStorage.subscript.setter();
        v44 = v81;
        ++v48;
      }
      while (v43 != v48);
    }
    v50 = v74;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v79, v41);
    v51 = v64;
    v64(v66, v80, v41);
    v52 = v77;
    v73(v77, v69, v47);
    v53 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v67, v44, v41);
    v54 = v75;
    v55 = (*(unsigned __int8 *)(v75 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
    v56 = (v68 + *(unsigned __int8 *)(v50 + 80) + v55) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    v57 = (char *)swift_allocObject();
    v58 = v70;
    *((_QWORD *)v57 + 2) = v41;
    *((_QWORD *)v57 + 3) = v58;
    v59 = v78;
    *((_QWORD *)v57 + 4) = v71;
    *((_QWORD *)v57 + 5) = v59;
    *((_QWORD *)v57 + 6) = v72;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(&v57[v55], v52, v47);
    v51(&v57[v56], v53, v41);
    return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  char *v62;
  char *v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;

  v71 = a6;
  v72 = a8;
  v81 = a3;
  v82 = a7;
  v67 = a1;
  v70 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v63 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)&v61 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  v68 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v75 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v61 - v19);
  v66 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)&v61 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v61 - v25;
  v65 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v73 = (char *)&v61 - v29;
  v76 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v69 = a2;
  v74 = v31;
  v31((char *)v28, a2, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = v26;
  v34 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v34 < 0)
    goto LABEL_10;
  v35 = v34;
  v36 = v74;
  if (v34)
  {
    v37 = 0;
    do
    {
      v36(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v37;
    }
    while (v35 != v37);
  }
  v38 = AssociatedTypeWitness;
  v39 = AssociatedTypeWitness;
  v40 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  v40(v32, v39);
  v64 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  v64(v73, v33, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v41 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v42 = v73;
    v43 = v63;
    v44 = v62;
    v79 = v38;
    v80 = v17;
    v78 = v40;
    if (v41)
    {
      v45 = 0;
      v77 = v41;
      v46 = (void (*)(char *, uint64_t))v78;
      do
      {
        v47 = v42;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        v48 = v79;
        dispatch thunk of static Numeric.* infix(_:_:)();
        v46(v43, v48);
        v46(v44, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v42 = v47;
        ++v45;
      }
      while (v77 != v45);
    }
    v49 = v75;
    (*(void (**)(char *, uint64_t))(v75 + 8))(v42, a4);
    v50 = v64;
    v64(v67, v83, a4);
    v51 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v66, v81, a4);
    v52 = v79;
    v53 = v80;
    v74(v80, v69, v79);
    v54 = (*(unsigned __int8 *)(v49 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v55 = v76;
    v56 = (v65 + *(unsigned __int8 *)(v76 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    v57 = (char *)swift_allocObject();
    v58 = v70;
    *((_QWORD *)v57 + 2) = a4;
    *((_QWORD *)v57 + 3) = v58;
    v59 = v82;
    *((_QWORD *)v57 + 4) = v71;
    *((_QWORD *)v57 + 5) = v59;
    *((_QWORD *)v57 + 6) = v72;
    v50(&v57[v54], v51, a4);
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(&v57[v56], v53, v52);
    return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  void (*v67)(char *, char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  void (*v75)(char *, uint64_t);
  char *v76;
  uint64_t v77;

  v71 = a5;
  v69 = a3;
  v60 = a2;
  v61 = a7;
  v58 = a1;
  v11 = *(_QWORD *)(a7 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v66 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v65 = (char *)&v57 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v57 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v68 = *(_QWORD *)(a6 - 8);
  v21 = MEMORY[0x24BDAC7A8]((char *)&v57 - v20);
  v74 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v59 = (char *)&v57 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v73 = (char *)&v57 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v57 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v72 = (char *)&v57 - v31;
  v77 = v32;
  v33 = v30;
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
  v34(v30, a4, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v35 = v29;
  v36 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v36 < 0)
    goto LABEL_14;
  v37 = v36;
  if (v36)
  {
    v38 = 0;
    do
    {
      v34((uint64_t)v19, v33, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v38;
    }
    while (v37 != v38);
  }
  v39 = *(void (**)(char *, uint64_t))(v77 + 8);
  v62 = AssociatedTypeWitness;
  v75 = v39;
  v76 = v19;
  v39((char *)v33, AssociatedTypeWitness);
  v67 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
  v67(v72, v35, a6);
  dispatch thunk of SIMDStorage.init()();
  v63 = a6;
  v64 = v11;
  v40 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v40 < 0)
    goto LABEL_14;
  v77 = a9;
  v41 = v65;
  v42 = v66;
  v43 = v63;
  v44 = v62;
  if (v40)
  {
    v45 = 0;
    v70 = v40;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v46 = v75;
      v75(v42, v44);
      v46(v41, v44);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v45;
    }
    while (v70 != v45);
  }
  v47 = v72;
  v72 = *(char **)(v68 + 8);
  ((void (*)(char *, uint64_t))v72)(v47, v43);
  v67(v58, v73, v43);
  dispatch thunk of SIMDStorage.init()();
  v48 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v48 < 0)
  {
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v49 = v65;
    v50 = v66;
    v51 = v63;
    v52 = v62;
    if (v48)
    {
      v53 = 0;
      v73 = (char *)v48;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v54 = v75;
        v75(v50, v52);
        v54(v49, v52);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v53;
      }
      while (v73 != v53);
    }
    v55 = v59;
    v67(v59, v74, v51);
    SIMD<>.sum()(*(_QWORD *)(v77 + 16), v60);
    return ((uint64_t (*)(char *, uint64_t))v72)(v55, v51);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.* infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
}

{
  static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpMultiply(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v59;
  char *v60;
  char *v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t);
  char *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;

  v69 = a6;
  v70 = a8;
  v76 = a7;
  v79 = a2;
  v65 = a1;
  v68 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v61 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v60 = (char *)&v59 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v59 - v16;
  v66 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v72 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v59 - v19);
  v64 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v78 = (char *)&v59 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v59 - v25;
  v63 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v77 = (char *)&v59 - v29;
  v73 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v67 = a3;
  v71 = v31;
  v31((char *)v28, a3, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = v26;
  v34 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v34 < 0)
    goto LABEL_10;
  v35 = v34;
  v36 = v71;
  if (v34)
  {
    v37 = 0;
    do
    {
      v36(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v37;
    }
    while (v35 != v37);
  }
  v38 = AssociatedTypeWitness;
  v39 = AssociatedTypeWitness;
  v40 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
  v40(v32, v39);
  v62 = *(void (**)(char *, char *, uint64_t))(v72 + 32);
  v62(v77, v33, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v41 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v42 = v79;
    v44 = v60;
    v43 = v61;
    v74 = v40;
    v75 = v17;
    if (v41)
    {
      v45 = 0;
      do
      {
        v46 = v41;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v47 = (void (*)(char *, uint64_t))v74;
        v74((uint64_t)v43, v38);
        v47(v44, v38);
        dispatch thunk of SIMDStorage.subscript.setter();
        v41 = v46;
        v42 = v79;
        ++v45;
      }
      while (v46 != v45);
    }
    v48 = v72;
    (*(void (**)(char *, uint64_t))(v72 + 8))(v77, a4);
    v49 = v62;
    v62(v65, v78, a4);
    v50 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v64, v42, a4);
    v51 = v75;
    v71(v75, v67, v38);
    v52 = (*(unsigned __int8 *)(v48 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    v53 = v73;
    v54 = (v63 + *(unsigned __int8 *)(v73 + 80) + v52) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
    v55 = (char *)swift_allocObject();
    v56 = v68;
    *((_QWORD *)v55 + 2) = a4;
    *((_QWORD *)v55 + 3) = v56;
    v57 = v76;
    *((_QWORD *)v55 + 4) = v69;
    *((_QWORD *)v55 + 5) = v57;
    *((_QWORD *)v55 + 6) = v70;
    v49(&v55[v52], v50, a4);
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(&v55[v54], v51, v38);
    return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v63;
  char *v64;
  char *v65;
  void (*v66)(char *, char *, uint64_t);
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  void (*v76)(char *, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;

  v73 = a6;
  v74 = a8;
  v83 = a3;
  v84 = a7;
  v68 = a1;
  v72 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v65 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v64 = (char *)&v63 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v63 - v16;
  v71 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v77 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v63 - v19);
  v69 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v85 = (char *)&v63 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v63 - v25;
  v67 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v75 = (char *)&v63 - v29;
  v78 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v70 = a2;
  v76 = v31;
  v31((char *)v28, a2, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = v26;
  v34 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v34 < 0)
    goto LABEL_10;
  v35 = v34;
  v36 = v76;
  if (v34)
  {
    v37 = 0;
    do
    {
      v36(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v37;
    }
    while (v35 != v37);
  }
  v38 = v17;
  v39 = AssociatedTypeWitness;
  v40 = AssociatedTypeWitness;
  v41 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
  v41(v32, v40);
  v66 = *(void (**)(char *, char *, uint64_t))(v77 + 32);
  v66(v75, v33, a4);
  dispatch thunk of SIMDStorage.init()();
  v42 = a4;
  v43 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v44 = v75;
    v45 = v65;
    v46 = v64;
    v81 = v39;
    v82 = v38;
    v80 = v41;
    if (v43)
    {
      v47 = 0;
      v79 = v43;
      v48 = (void (*)(char *, uint64_t))v80;
      do
      {
        v49 = v44;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        v50 = v81;
        dispatch thunk of static Numeric.* infix(_:_:)();
        v48(v45, v50);
        v48(v46, v50);
        dispatch thunk of SIMDStorage.subscript.setter();
        v44 = v49;
        ++v47;
      }
      while (v79 != v47);
    }
    v51 = v77;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v44, v42);
    v52 = v66;
    v66(v68, v85, v42);
    v54 = v81;
    v53 = v82;
    v76(v82, v70, v81);
    v55 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v69, v83, v42);
    v56 = v78;
    v57 = (*(unsigned __int8 *)(v78 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
    v58 = (v71 + *(unsigned __int8 *)(v51 + 80) + v57) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
    v59 = (char *)swift_allocObject();
    v60 = v72;
    *((_QWORD *)v59 + 2) = v42;
    *((_QWORD *)v59 + 3) = v60;
    v61 = v84;
    *((_QWORD *)v59 + 4) = v73;
    *((_QWORD *)v59 + 5) = v61;
    *((_QWORD *)v59 + 6) = v74;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(&v59[v57], v53, v54);
    v52(&v59[v58], v55, v42);
    return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  void (*v65)(char *, uint64_t);
  void (*v66)(char *, uint64_t);
  char *v67;
  uint64_t AssociatedConformanceWitness;
  char *v69;
  uint64_t result;
  _QWORD v71[2];
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t);
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  void (*v84)(char *, char *, uint64_t);
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  void (*v92)(uint64_t, uint64_t);

  v90 = a7;
  v75 = a6;
  v72 = a4;
  v71[1] = a3;
  v74 = a1;
  v76 = a8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v82 = (char *)v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v71 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v79 = (char *)v71 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v71 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v77 = *(_QWORD *)(a5 - 8);
  v22 = MEMORY[0x24BDAC7A8]((char *)v71 - v21);
  v89 = (char *)v71 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v80 = (char *)v71 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v88 = (char *)v71 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v73 = (char *)v71 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v87 = (char *)v71 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)v71 - v33;
  v35 = MEMORY[0x24BDAC7A8](v32);
  v86 = (char *)v71 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v83 = (char *)v71 - v38;
  v92 = v39;
  v40 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v39 + 2);
  v41 = v37;
  v40(v37, a2, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v42 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v42 < 0)
    goto LABEL_18;
  v43 = v42;
  v81 = v15;
  if (v42)
  {
    v44 = 0;
    do
    {
      v40((uint64_t)v20, v41, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v44;
    }
    while (v43 != v44);
  }
  v91 = v20;
  v78 = (void (*)(char *, uint64_t, uint64_t))v40;
  v45 = a5;
  v46 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v92 + 1);
  v46(v41, AssociatedTypeWitness);
  v84 = *(void (**)(char *, char *, uint64_t))(v77 + 32);
  v84(v86, v34, a5);
  dispatch thunk of SIMDStorage.init()();
  v47 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v47 < 0)
    goto LABEL_18;
  v48 = v79;
  v49 = v81;
  v92 = v46;
  if (v47)
  {
    v50 = 0;
    v85 = v47;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v51 = (void (*)(char *, uint64_t))v92;
      v92((uint64_t)v49, AssociatedTypeWitness);
      v51(v48, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v50;
    }
    while (v85 != v50);
  }
  v52 = v86;
  v86 = *(char **)(v77 + 8);
  ((void (*)(char *, uint64_t))v86)(v52, a5);
  v84(v83, v87, a5);
  v78(v82, v72, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v53 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v53 < 0)
    goto LABEL_18;
  v54 = v53;
  v55 = v82;
  v56 = v80;
  v57 = (void (*)(char *, char *, uint64_t))v78;
  v58 = v91;
  if (v53)
  {
    v59 = 0;
    do
    {
      v57(v58, v55, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v59;
    }
    while (v54 != v59);
  }
  v92((uint64_t)v55, AssociatedTypeWitness);
  v84(v88, v56, v45);
  dispatch thunk of SIMDStorage.init()();
  v60 = v45;
  v61 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v61 < 0)
  {
LABEL_18:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v62 = v81;
    v63 = v79;
    if (v61)
    {
      v64 = 0;
      v87 = (char *)v61;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v65 = (void (*)(char *, uint64_t))v92;
        v92((uint64_t)v62, AssociatedTypeWitness);
        v65(v63, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v64;
      }
      while (v87 != v64);
    }
    v66 = (void (*)(char *, uint64_t))v86;
    ((void (*)(char *, uint64_t))v86)(v88, v45);
    v67 = v73;
    v84(v73, v89, v60);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v69 = v83;
    MEMORY[0x2199FF9FC](v83, v67, v60, AssociatedConformanceWitness);
    v66(v67, v60);
    return ((uint64_t (*)(char *, uint64_t))v66)(v69, v60);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.* infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
}

{
  static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpDivide(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  char *v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;

  v70 = a6;
  v71 = a8;
  v77 = a7;
  v80 = a2;
  v65 = a1;
  v69 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v62 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v61 = (char *)&v60 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v60 - v16;
  v67 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v73 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v60 - v19);
  v66 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v79 = (char *)&v60 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v60 - v25;
  v64 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v78 = (char *)&v60 - v29;
  v74 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v68 = a3;
  v72 = v31;
  v31((char *)v28, a3, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v33 < 0)
    goto LABEL_10;
  v34 = v33;
  v35 = v72;
  if (v33)
  {
    v36 = 0;
    do
    {
      v35(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v36;
    }
    while (v34 != v36);
  }
  v37 = v17;
  v38 = AssociatedTypeWitness;
  v39 = AssociatedTypeWitness;
  v40 = *(void (**)(uint64_t, uint64_t))(v74 + 8);
  v40(v32, v39);
  v63 = *(void (**)(char *, char *, uint64_t))(v73 + 32);
  v63(v78, v26, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = a4;
  v42 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v42 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v43 = v42;
    v44 = v80;
    v45 = v61;
    v46 = v62;
    v75 = v40;
    v76 = v37;
    if (v42)
    {
      v47 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v48 = (void (*)(char *, uint64_t))v75;
        v75((uint64_t)v46, v38);
        v48(v45, v38);
        dispatch thunk of SIMDStorage.subscript.setter();
        v44 = v80;
        ++v47;
      }
      while (v43 != v47);
    }
    v49 = v73;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v78, v41);
    v50 = v63;
    v63(v65, v79, v41);
    v51 = v76;
    v72(v76, v68, v38);
    v52 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v66, v44, v41);
    v53 = v74;
    v54 = (*(unsigned __int8 *)(v74 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
    v55 = (v67 + *(unsigned __int8 *)(v49 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v56 = (char *)swift_allocObject();
    v57 = v69;
    *((_QWORD *)v56 + 2) = v41;
    *((_QWORD *)v56 + 3) = v57;
    v58 = v77;
    *((_QWORD *)v56 + 4) = v70;
    *((_QWORD *)v56 + 5) = v58;
    *((_QWORD *)v56 + 6) = v71;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(&v56[v54], v51, v38);
    v50(&v56[v55], v52, v41);
    return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  char *v62;
  char *v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;

  v71 = a6;
  v72 = a8;
  v81 = a3;
  v82 = a7;
  v67 = a1;
  v70 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v63 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)&v61 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  v68 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v75 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v61 - v19);
  v66 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)&v61 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v61 - v25;
  v65 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v73 = (char *)&v61 - v29;
  v76 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v69 = a2;
  v74 = v31;
  v31((char *)v28, a2, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = v26;
  v34 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v34 < 0)
    goto LABEL_10;
  v35 = v34;
  v36 = v74;
  if (v34)
  {
    v37 = 0;
    do
    {
      v36(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v37;
    }
    while (v35 != v37);
  }
  v38 = AssociatedTypeWitness;
  v39 = AssociatedTypeWitness;
  v40 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  v40(v32, v39);
  v64 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  v64(v73, v33, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v41 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v42 = v73;
    v43 = v63;
    v44 = v62;
    v79 = v38;
    v80 = v17;
    v78 = v40;
    if (v41)
    {
      v45 = 0;
      v77 = v41;
      v46 = (void (*)(char *, uint64_t))v78;
      do
      {
        v47 = v42;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        v48 = v79;
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v46(v43, v48);
        v46(v44, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v42 = v47;
        ++v45;
      }
      while (v77 != v45);
    }
    v49 = v75;
    (*(void (**)(char *, uint64_t))(v75 + 8))(v42, a4);
    v50 = v64;
    v64(v67, v83, a4);
    v51 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v66, v81, a4);
    v52 = v79;
    v53 = v80;
    v74(v80, v69, v79);
    v54 = (*(unsigned __int8 *)(v49 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v55 = v76;
    v56 = (v65 + *(unsigned __int8 *)(v76 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    v57 = (char *)swift_allocObject();
    v58 = v70;
    *((_QWORD *)v57 + 2) = a4;
    *((_QWORD *)v57 + 3) = v58;
    v59 = v82;
    *((_QWORD *)v57 + 4) = v71;
    *((_QWORD *)v57 + 5) = v59;
    *((_QWORD *)v57 + 6) = v72;
    v50(&v57[v54], v51, a4);
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(&v57[v56], v53, v52);
    return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t AssociatedConformanceWitness;
  char *v78;
  char *v79;
  void (*v80)(char *, char *, uint64_t);
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t);
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  char *v95;
  void (*v96)(char *, uint64_t);
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  char *v107;
  void (*v108)(char *, char *, uint64_t);
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(char *, uint64_t);
  void (*v118)(char *, uint64_t);
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(char *, uint64_t);
  uint64_t (*v126)(char *, uint64_t);
  char *v127;
  uint64_t result;
  char *v129;
  uint64_t AssociatedTypeWitness;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  void (*v146)(uint64_t, uint64_t);
  char *v147;
  char *v148;
  void (*v149)(char *, char *, uint64_t);
  void (*v150)(char *, uint64_t);
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  char *v155;
  char *v156;
  uint64_t v157;
  char *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  char *v162;
  char *v163;
  void (*v164)(char *, uint64_t);
  uint64_t v165;

  v151 = a5;
  v153 = a3;
  v135 = a2;
  v131 = a1;
  v161 = *(_QWORD *)(a9 + 16);
  v152 = *(_QWORD *)(*(_QWORD *)(v161 + 16) + 8);
  v12 = *(_QWORD *)(v152 + 16);
  v136 = a7;
  v13 = *(_QWORD *)(a7 + 48);
  swift_getAssociatedTypeWitness();
  v132 = v12;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v129 = (char *)&v129 - v14;
  v15 = swift_checkMetadataState();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v143 = (char *)&v129 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v145 = (char *)&v129 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v139 = (char *)&v129 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v141 = (char *)&v129 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v148 = (char *)&v129 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v147 = (char *)&v129 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v129 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v137 = *(_QWORD *)(a6 - 8);
  v32 = MEMORY[0x24BDAC7A8]((char *)&v129 - v31);
  v160 = (char *)&v129 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v32);
  v159 = (char *)&v129 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v142 = (char *)&v129 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v158 = (char *)&v129 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v156 = (char *)&v129 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v138 = (char *)&v129 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v140 = (char *)&v129 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v162 = (char *)&v129 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v144 = (char *)&v129 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v134 = (char *)&v129 - v51;
  v52 = MEMORY[0x24BDAC7A8](v50);
  v155 = (char *)&v129 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v56 = (char *)&v129 - v55;
  v57 = MEMORY[0x24BDAC7A8](v54);
  v154 = (char *)&v129 - v58;
  v164 = v59;
  v60 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v59 + 2);
  v61 = v57;
  v133 = a4;
  v165 = v62;
  v60(v57, a4);
  dispatch thunk of SIMDStorage.init()();
  v63 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v63 < 0)
    goto LABEL_30;
  v64 = v63;
  if (v63)
  {
    v65 = 0;
    do
    {
      ((void (*)(char *, uint64_t, uint64_t))v60)(v30, v61, v165);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v65;
    }
    while (v64 != v65);
  }
  v146 = v60;
  v66 = (void (*)(char *, uint64_t))*((_QWORD *)v164 + 1);
  v163 = v30;
  v164 = v66;
  v66((char *)v61, v165);
  v149 = *(void (**)(char *, char *, uint64_t))(v137 + 32);
  v149(v154, v56, a6);
  dispatch thunk of SIMDStorage.init()();
  v67 = a6;
  v157 = v13;
  v68 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v68 < 0)
    goto LABEL_30;
  v70 = v147;
  v69 = v148;
  if (v68)
  {
    v71 = 0;
    v150 = (void (*)(char *, uint64_t))v68;
    v72 = v165;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      v73 = v164;
      v164(v69, v72);
      v73(v70, v72);
      dispatch thunk of SIMDStorage.subscript.setter();
      v71 = (void (*)(char *, uint64_t))((char *)v71 + 1);
    }
    while (v150 != v71);
  }
  v150 = *(void (**)(char *, uint64_t))(v137 + 8);
  v150(v154, a6);
  v149(v131, v155, a6);
  v74 = v132;
  v75 = v165;
  v76 = AssociatedTypeWitness;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v78 = v129;
  MEMORY[0x2199FFA5C](&unk_216C92760, 256, v76, AssociatedConformanceWitness);
  v79 = v141;
  MEMORY[0x2199FFA50](v78, v75, v74);
  v80 = (void (*)(char *, char *, uint64_t))v146;
  ((void (*)(char *, char *, uint64_t))v146)(v139, v79, v75);
  dispatch thunk of SIMDStorage.init()();
  v81 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v81 < 0)
    goto LABEL_30;
  v82 = v81;
  v83 = v163;
  v84 = v139;
  v85 = v138;
  if (v81)
  {
    v86 = 0;
    do
    {
      v80(v83, v84, v165);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v86;
    }
    while (v82 != v86);
  }
  v87 = v164;
  v164(v84, v165);
  v149(v140, v85, v67);
  dispatch thunk of SIMDStorage.init()();
  v88 = v67;
  v89 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v89 < 0)
    goto LABEL_30;
  v90 = (char *)v89;
  v87(v141, v165);
  v92 = v147;
  v91 = v148;
  v93 = v157;
  v94 = v140;
  if (v90)
  {
    v95 = 0;
    v154 = a10;
    v155 = v90;
    v96 = v164;
    do
    {
      v97 = v94;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      v98 = v165;
      swift_getAssociatedConformanceWitness();
      dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
      v96(v91, v98);
      v96(v92, v98);
      dispatch thunk of SIMDStorage.subscript.setter();
      v94 = v97;
      ++v95;
    }
    while (v155 != v95);
  }
  v150(v94, v88);
  v149(v162, v156, v88);
  v99 = v145;
  v100 = v165;
  dispatch thunk of static Numeric.* infix(_:_:)();
  ((void (*)(char *, char *, uint64_t))v146)(v143, v99, v100);
  dispatch thunk of SIMDStorage.init()();
  v101 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v101 < 0)
    goto LABEL_30;
  v102 = v101;
  v103 = v93;
  v104 = v88;
  v105 = v143;
  v106 = v142;
  v108 = (void (*)(char *, char *, uint64_t))v146;
  v107 = v147;
  v109 = v163;
  if (v101)
  {
    v110 = 0;
    do
    {
      v108(v109, v105, v165);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v110;
    }
    while (v102 != v110);
  }
  v164(v105, v165);
  v149(v158, v106, v104);
  dispatch thunk of SIMDStorage.init()();
  v111 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v111 < 0)
    goto LABEL_30;
  v112 = v111;
  v113 = v162;
  v114 = v148;
  if (v111)
  {
    v115 = 0;
    v116 = v165;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      v117 = v164;
      v164(v114, v116);
      v117(v107, v116);
      dispatch thunk of SIMDStorage.subscript.setter();
      v113 = v162;
      ++v115;
    }
    while (v112 != v115);
  }
  v118 = v150;
  v150(v158, v104);
  v164(v145, v165);
  v118(v113, v104);
  v149(v144, v159, v104);
  dispatch thunk of SIMDStorage.init()();
  v119 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v119 < 0)
  {
LABEL_30:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v120 = v144;
    if (v119)
    {
      v121 = 0;
      v162 = (char *)v119;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        v122 = v165;
        dispatch thunk of static Numeric.* infix(_:_:)();
        v123 = v103;
        v124 = v104;
        v125 = v164;
        v164(v114, v122);
        v125(v107, v122);
        v104 = v124;
        v103 = v123;
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v121;
      }
      while (v162 != v121);
    }
    v126 = (uint64_t (*)(char *, uint64_t))v150;
    v150(v120, v104);
    v127 = v134;
    v149(v134, v160, v104);
    SIMD<>.sum()(v161, v135);
    return v126(v127, v104);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>./ infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static SIMD<>._vjpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
}

{
  static SIMD<>._vjpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpDivide(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  char *v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;

  v70 = a6;
  v71 = a8;
  v77 = a7;
  v80 = a2;
  v65 = a1;
  v69 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v62 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v61 = (char *)&v60 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v60 - v16;
  v67 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v73 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v60 - v19);
  v66 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v79 = (char *)&v60 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v60 - v25;
  v64 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v78 = (char *)&v60 - v29;
  v74 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v68 = a3;
  v72 = v31;
  v31((char *)v28, a3, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v33 < 0)
    goto LABEL_10;
  v34 = v33;
  v35 = v72;
  if (v33)
  {
    v36 = 0;
    do
    {
      v35(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v36;
    }
    while (v34 != v36);
  }
  v37 = v17;
  v38 = AssociatedTypeWitness;
  v39 = AssociatedTypeWitness;
  v40 = *(void (**)(uint64_t, uint64_t))(v74 + 8);
  v40(v32, v39);
  v63 = *(void (**)(char *, char *, uint64_t))(v73 + 32);
  v63(v78, v26, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = a4;
  v42 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v42 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v43 = v42;
    v44 = v80;
    v45 = v61;
    v46 = v62;
    v75 = v40;
    v76 = v37;
    if (v42)
    {
      v47 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v48 = (void (*)(char *, uint64_t))v75;
        v75((uint64_t)v46, v38);
        v48(v45, v38);
        dispatch thunk of SIMDStorage.subscript.setter();
        v44 = v80;
        ++v47;
      }
      while (v43 != v47);
    }
    v49 = v73;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v78, v41);
    v50 = v63;
    v63(v65, v79, v41);
    v51 = v76;
    v72(v76, v68, v38);
    v52 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v66, v44, v41);
    v53 = v74;
    v54 = (*(unsigned __int8 *)(v74 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
    v55 = (v67 + *(unsigned __int8 *)(v49 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v56 = (char *)swift_allocObject();
    v57 = v69;
    *((_QWORD *)v56 + 2) = v41;
    *((_QWORD *)v56 + 3) = v57;
    v58 = v77;
    *((_QWORD *)v56 + 4) = v70;
    *((_QWORD *)v56 + 5) = v58;
    *((_QWORD *)v56 + 6) = v71;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(&v56[v54], v51, v38);
    v50(&v56[v55], v52, v41);
    return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v61;
  char *v62;
  char *v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;

  v71 = a6;
  v72 = a8;
  v81 = a3;
  v82 = a7;
  v67 = a1;
  v70 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v63 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)&v61 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  v68 = v18;
  MEMORY[0x24BDAC7A8](v15);
  v75 = *(_QWORD *)(a4 - 8);
  v20 = MEMORY[0x24BDAC7A8]((char *)&v61 - v19);
  v66 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)&v61 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v61 - v25;
  v65 = v27;
  v28 = MEMORY[0x24BDAC7A8](v24);
  v73 = (char *)&v61 - v29;
  v76 = v30;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v32 = v28;
  v69 = a2;
  v74 = v31;
  v31((char *)v28, a2, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v33 = v26;
  v34 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v34 < 0)
    goto LABEL_10;
  v35 = v34;
  v36 = v74;
  if (v34)
  {
    v37 = 0;
    do
    {
      v36(v17, v32, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v37;
    }
    while (v35 != v37);
  }
  v38 = AssociatedTypeWitness;
  v39 = AssociatedTypeWitness;
  v40 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  v40(v32, v39);
  v64 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  v64(v73, v33, a4);
  dispatch thunk of SIMDStorage.init()();
  v41 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v41 < 0)
  {
LABEL_10:
    result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v42 = v73;
    v43 = v63;
    v44 = v62;
    v79 = v38;
    v80 = v17;
    v78 = v40;
    if (v41)
    {
      v45 = 0;
      v77 = v41;
      v46 = (void (*)(char *, uint64_t))v78;
      do
      {
        v47 = v42;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        v48 = v79;
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v46(v43, v48);
        v46(v44, v48);
        dispatch thunk of SIMDStorage.subscript.setter();
        v42 = v47;
        ++v45;
      }
      while (v77 != v45);
    }
    v49 = v75;
    (*(void (**)(char *, uint64_t))(v75 + 8))(v42, a4);
    v50 = v64;
    v64(v67, v83, a4);
    v51 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v66, v81, a4);
    v52 = v79;
    v53 = v80;
    v74(v80, v69, v79);
    v54 = (*(unsigned __int8 *)(v49 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v55 = v76;
    v56 = (v65 + *(unsigned __int8 *)(v76 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    v57 = (char *)swift_allocObject();
    v58 = v70;
    *((_QWORD *)v57 + 2) = a4;
    *((_QWORD *)v57 + 3) = v58;
    v59 = v82;
    *((_QWORD *)v57 + 4) = v71;
    *((_QWORD *)v57 + 5) = v59;
    *((_QWORD *)v57 + 6) = v72;
    v50(&v57[v54], v51, a4);
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(&v57[v56], v53, v52);
    return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t);
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  char *v65;
  void (*v66)(char *, char *, uint64_t);
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  char *v82;
  void (*v83)(char *, uint64_t);
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  void (*v92)(char *, char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  void (*v100)(char *, uint64_t);
  uint64_t (*v101)(char *, uint64_t);
  uint64_t result;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  void (*v119)(char *, char *, uint64_t);
  void (*v120)(char *, uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  char *v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  void (*v133)(char *, uint64_t);

  v130 = a8;
  v107 = a7;
  v106 = a4;
  v104 = a2;
  v103 = a1;
  v122 = a9;
  v11 = *(_QWORD *)(a6 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v115 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v116 = (char *)&v103 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v112 = (char *)&v103 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v118 = (char *)&v103 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v117 = (char *)&v103 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v103 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v109 = *(_QWORD *)(a5 - 8);
  v27 = MEMORY[0x24BDAC7A8]((char *)&v103 - v26);
  v114 = (char *)&v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v128 = (char *)&v103 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v127 = (char *)&v103 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v110 = (char *)&v103 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v126 = (char *)&v103 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v105 = (char *)&v103 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v124 = (char *)&v103 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v43 = (char *)&v103 - v42;
  v44 = MEMORY[0x24BDAC7A8](v41);
  v123 = (char *)&v103 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v113 = (char *)&v103 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v132 = (char *)&v103 - v49;
  v133 = v50;
  v51 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v50 + 2);
  v52 = v48;
  v108 = a3;
  v120 = v51;
  v51((char *)v48, a3, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v53 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v53 < 0)
    goto LABEL_26;
  v54 = v53;
  v55 = v120;
  if (v53)
  {
    v56 = 0;
    do
    {
      v55(v25, v52, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v56;
    }
    while (v54 != v56);
  }
  v131 = v25;
  v57 = (void (*)(char *, uint64_t))*((_QWORD *)v133 + 1);
  v129 = AssociatedTypeWitness;
  v133 = v57;
  v57((char *)v52, AssociatedTypeWitness);
  v119 = *(void (**)(char *, char *, uint64_t))(v109 + 32);
  v119(v123, v43, a5);
  dispatch thunk of SIMDStorage.init()();
  v111 = a5;
  v125 = v11;
  v58 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v58 < 0)
    goto LABEL_26;
  v60 = v117;
  v59 = v118;
  v61 = v111;
  v62 = v129;
  if (v58)
  {
    v63 = 0;
    v121 = v58;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v64 = v133;
      v133(v59, v62);
      v64(v60, v62);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v63;
    }
    while (v121 != v63);
  }
  v65 = v123;
  v123 = *(char **)(v109 + 8);
  ((void (*)(char *, uint64_t))v123)(v65, v61);
  v119(v113, v124, v61);
  v66 = (void (*)(char *, char *, uint64_t))v120;
  v120(v112, v104, v62);
  dispatch thunk of SIMDStorage.init()();
  v67 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v67 < 0)
    goto LABEL_26;
  v68 = v67;
  v69 = v112;
  v70 = v110;
  v71 = v131;
  v72 = v111;
  v73 = v129;
  if (v67)
  {
    v74 = 0;
    do
    {
      v66(v71, v69, v73);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v74;
    }
    while (v68 != v74);
  }
  v133(v69, v73);
  v119(v126, v70, v72);
  dispatch thunk of SIMDStorage.init()();
  v75 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v75 < 0)
    goto LABEL_26;
  v76 = v72;
  v78 = v117;
  v77 = v118;
  if (v75)
  {
    v79 = 0;
    v124 = (char *)v75;
    v80 = v133;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      v81 = v129;
      dispatch thunk of static Numeric.* infix(_:_:)();
      v80(v77, v81);
      v80(v78, v81);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v79;
    }
    while (v124 != v79);
  }
  v82 = v131;
  v83 = (void (*)(char *, uint64_t))v123;
  ((void (*)(char *, uint64_t))v123)(v126, v76);
  v84 = v105;
  v119(v105, v127, v76);
  swift_getAssociatedConformanceWitness();
  v85 = v113;
  dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  v83(v84, v76);
  v83(v85, v76);
  v86 = v129;
  v130 = *(_QWORD *)(v130 + 16);
  v87 = v116;
  dispatch thunk of static Numeric.* infix(_:_:)();
  v120(v115, (uint64_t)v87, v86);
  dispatch thunk of SIMDStorage.init()();
  v88 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v88 < 0)
    goto LABEL_26;
  v89 = v88;
  v90 = v114;
  v91 = v115;
  v92 = (void (*)(char *, char *, uint64_t))v120;
  if (v88)
  {
    v93 = 0;
    do
    {
      v92(v82, v91, v86);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v93;
    }
    while (v89 != v93);
  }
  v133(v91, v86);
  v119(v128, v90, v76);
  dispatch thunk of SIMDStorage.init()();
  v94 = dispatch thunk of Sequence.underestimatedCount.getter();
  v95 = v117;
  if (v94 < 0)
  {
LABEL_26:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v96 = v94;
    v97 = v132;
    v98 = v118;
    if (v94)
    {
      v99 = 0;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v100 = v133;
        v133(v98, v86);
        v100(v95, v86);
        dispatch thunk of SIMDStorage.subscript.setter();
        v97 = v132;
        ++v99;
      }
      while (v96 != v99);
    }
    v101 = (uint64_t (*)(char *, uint64_t))v123;
    ((void (*)(char *, uint64_t))v123)(v128, v76);
    v133(v116, v86);
    return v101(v97, v76);
  }
  return result;
}

{
  char *v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  void (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  void (*v70)(char *, char *, uint64_t);
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  void (*v79)(char *, uint64_t);
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  void (*v95)(char *, uint64_t);
  uint64_t (*v96)(char *, uint64_t);
  uint64_t result;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  void (*v103)(char *, uint64_t, uint64_t);
  char *v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  void (*v111)(char *, char *, uint64_t);
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  char *v123;
  void (*v124)(char *, uint64_t);

  v122 = a8;
  v101 = a7;
  v99 = a4;
  v115 = a2;
  v116 = a3;
  v117 = a9;
  v11 = *(char **)(a6 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v105 = (char *)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v113 = (char *)&v98 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v112 = (char *)&v98 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v98 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v108 = *(_QWORD *)(a5 - 8);
  v23 = MEMORY[0x24BDAC7A8]((char *)&v98 - v22);
  v119 = (char *)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v120 = (char *)&v98 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v118 = (char *)&v98 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v104 = (char *)&v98 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v106 = (char *)&v98 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v100 = (char *)&v98 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v121 = (char *)&v98 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v98 - v38;
  v40 = MEMORY[0x24BDAC7A8](v37);
  v102 = (char *)&v98 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v107 = (char *)&v98 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v109 = (char *)&v98 - v45;
  v124 = v46;
  v47 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v46 + 2);
  v48 = v44;
  v47(v44, a1, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v49 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v49 < 0)
    goto LABEL_26;
  v50 = v49;
  if (v49)
  {
    v51 = 0;
    do
    {
      v47((uint64_t)v21, v48, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v51;
    }
    while (v50 != v51);
  }
  v123 = v21;
  v103 = (void (*)(char *, uint64_t, uint64_t))v47;
  v52 = (void (*)(char *, uint64_t))*((_QWORD *)v124 + 1);
  v110 = AssociatedTypeWitness;
  v124 = v52;
  v52((char *)v48, AssociatedTypeWitness);
  v111 = *(void (**)(char *, char *, uint64_t))(v108 + 32);
  v111(v102, v39, a5);
  dispatch thunk of SIMDStorage.init()();
  v53 = a5;
  v54 = v11;
  v55 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v55 < 0)
    goto LABEL_26;
  v56 = v112;
  v57 = v113;
  v58 = v102;
  v59 = v110;
  if (v55)
  {
    v60 = 0;
    v114 = v55;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v61 = v124;
      v124(v57, v59);
      v61(v56, v59);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v60;
    }
    while (v114 != v60);
  }
  v108 = *(_QWORD *)(v108 + 8);
  ((void (*)(char *, uint64_t))v108)(v58, v53);
  v111(v107, v121, v53);
  v103(v105, v99, v59);
  dispatch thunk of SIMDStorage.init()();
  v62 = v53;
  v63 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v63 < 0)
    goto LABEL_26;
  v64 = v63;
  v65 = v54;
  v66 = v59;
  v68 = v104;
  v67 = v105;
  v69 = v112;
  v70 = (void (*)(char *, char *, uint64_t))v103;
  v71 = v123;
  v121 = v65;
  if (v63)
  {
    v72 = 0;
    do
    {
      v70(v71, v67, v66);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v72;
    }
    while (v64 != v72);
  }
  v124(v67, v66);
  v111(v106, v68, v62);
  dispatch thunk of SIMDStorage.init()();
  v73 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v73 < 0)
    goto LABEL_26;
  v74 = v106;
  v75 = v113;
  v76 = v110;
  if (v73)
  {
    v77 = 0;
    v114 = v73;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v78 = v124;
      v124(v75, v76);
      v78(v69, v76);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v77;
    }
    while (v114 != v77);
  }
  v79 = (void (*)(char *, uint64_t))v108;
  ((void (*)(char *, uint64_t))v108)(v74, v62);
  v80 = v100;
  v111(v100, v118, v62);
  swift_getAssociatedConformanceWitness();
  v81 = v107;
  dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  v79(v80, v62);
  v79(v81, v62);
  dispatch thunk of SIMDStorage.init()();
  v115 = v62;
  v82 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v82 < 0)
    goto LABEL_26;
  v83 = v115;
  v85 = v112;
  v84 = v113;
  v86 = v110;
  if (v82)
  {
    v87 = 0;
    v118 = (char *)v82;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v88 = v124;
      v124(v84, v86);
      v88(v85, v86);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v87;
    }
    while (v118 != v87);
  }
  v111(v120, v119, v83);
  dispatch thunk of SIMDStorage.init()();
  v89 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v89 < 0)
  {
LABEL_26:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v90 = v109;
    v92 = v112;
    v91 = v113;
    v93 = v115;
    if (v89)
    {
      v94 = 0;
      v119 = (char *)v89;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v95 = v124;
        v124(v91, v86);
        v95(v92, v86);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v94;
      }
      while (v119 != v94);
    }
    v96 = (uint64_t (*)(char *, uint64_t))v108;
    ((void (*)(char *, uint64_t))v108)(v120, v93);
    return v96(v90, v93);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>./ infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
}

{
  static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
}

uint64_t closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD, _QWORD);
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t result;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  char *v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  char *v71;
  char *v72;

  v58 = a7;
  v59 = a5;
  v66 = a4;
  v64 = a3;
  v69 = a2;
  v57 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v70 = *(void (**)(char *, uint64_t))(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v61 = (char *)&v55 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v60 = (char *)&v55 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v72 = (char *)&v55 - v19;
  v56 = *(_QWORD *)(a6 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v62 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v71 = (char *)&v55 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v55 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v55 = (char *)&v55 - v27;
  dispatch thunk of SIMDStorage.init()();
  v28 = a6;
  v29 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v29 < 0)
    goto LABEL_14;
  v63 = v13;
  v67 = v26;
  v68 = a9;
  v30 = v60;
  v31 = v61;
  v32 = v28;
  if (v29)
  {
    v33 = 0;
    v65 = v29;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v34 = (void (*)(char *, uint64_t))*((_QWORD *)v70 + 1);
      v34(v31, AssociatedTypeWitness);
      v34(v30, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v33;
    }
    while (v65 != v33);
  }
  v35 = v55;
  v36 = v56;
  v37 = (void (*)(_QWORD, _QWORD, _QWORD))v67;
  v67 = *(char **)(v56 + 32);
  ((void (*)(char *, _QWORD, uint64_t))v67)(v55, v37, v28);
  v68 = *(_QWORD *)(v68 + 16);
  SIMD<>.sum()(v68, v57);
  v66 = *(void (**)(char *, uint64_t))(v36 + 8);
  v66(v35, v28);
  v38 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v70 + 2);
  v38(v63, v59, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v39 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v39 < 0)
    goto LABEL_14;
  v40 = v39;
  v42 = v62;
  v41 = v63;
  v43 = v72;
  if (v39)
  {
    v44 = 0;
    do
    {
      v38(v43, (uint64_t)v41, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v44;
    }
    while (v40 != v44);
  }
  v46 = v60;
  v45 = v61;
  v47 = v41;
  v48 = (void (*)(char *, uint64_t))*((_QWORD *)v70 + 1);
  v48(v47, AssociatedTypeWitness);
  ((void (*)(char *, char *, uint64_t))v67)(v71, v42, v32);
  dispatch thunk of SIMDStorage.init()();
  v49 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v49 < 0)
  {
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v50 = v64;
    v70 = v48;
    if (v49)
    {
      v51 = 0;
      v67 = (char *)v49;
      do
      {
        v52 = v50;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v53 = v70;
        v70(v45, AssociatedTypeWitness);
        v53(v46, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        v50 = v52;
        ++v51;
      }
      while (v67 != v51);
    }
    return ((uint64_t (*)(char *, uint64_t))v66)(v71, v32);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)@<X0>(uint64_t a1@<X0>, void (*a2)(char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  void (*v66)(char *, uint64_t);
  void (*v67)(char *, uint64_t);
  char *v68;
  uint64_t AssociatedConformanceWitness;
  char *v70;
  uint64_t result;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  void (*v79)(char *, uint64_t, uint64_t);
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  void (*v86)(char *, char *, uint64_t);
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  void (*v94)(uint64_t, uint64_t);

  v92 = a7;
  v75 = a6;
  v88 = a2;
  v89 = a4;
  v73 = a1;
  v76 = a8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v83 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v72 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v80 = (char *)&v72 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v72 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v78 = *(_QWORD *)(a5 - 8);
  v22 = MEMORY[0x24BDAC7A8]((char *)&v72 - v21);
  v91 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v81 = (char *)&v72 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v84 = (char *)&v72 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v74 = (char *)&v72 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v90 = (char *)&v72 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v72 - v33;
  v35 = MEMORY[0x24BDAC7A8](v32);
  v77 = (char *)&v72 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v85 = (char *)&v72 - v38;
  v94 = v39;
  v40 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v39 + 2);
  v41 = v37;
  v40(v37, a3, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v42 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v42 < 0)
    goto LABEL_18;
  v43 = v42;
  v82 = v15;
  if (v42)
  {
    v44 = 0;
    do
    {
      v40((uint64_t)v20, v41, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v44;
    }
    while (v43 != v44);
  }
  v93 = v20;
  v79 = (void (*)(char *, uint64_t, uint64_t))v40;
  v45 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v94 + 1);
  v45(v41, AssociatedTypeWitness);
  v86 = *(void (**)(char *, char *, uint64_t))(v78 + 32);
  v86(v77, v34, a5);
  dispatch thunk of SIMDStorage.init()();
  v46 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v46 < 0)
    goto LABEL_18;
  v47 = v80;
  v48 = v82;
  v49 = v77;
  v94 = v45;
  if (v46)
  {
    v50 = 0;
    v87 = v46;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v51 = (void (*)(char *, uint64_t))v94;
      v94((uint64_t)v48, AssociatedTypeWitness);
      v51(v47, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v50;
    }
    while (v87 != v50);
  }
  v88 = *(void (**)(char *, uint64_t))(v78 + 8);
  v88(v49, a5);
  v86(v85, v90, a5);
  v79(v83, v73, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v52 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v52 < 0)
    goto LABEL_18;
  v53 = v52;
  v54 = a5;
  v55 = v83;
  v56 = v81;
  v57 = (void (*)(char *, char *, uint64_t))v79;
  v58 = v93;
  if (v52)
  {
    v59 = 0;
    do
    {
      v57(v58, v55, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v59;
    }
    while (v53 != v59);
  }
  v94((uint64_t)v55, AssociatedTypeWitness);
  v86(v84, v56, v54);
  dispatch thunk of SIMDStorage.init()();
  v60 = v54;
  v61 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v61 < 0)
  {
LABEL_18:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v62 = v84;
    v63 = v82;
    v64 = v80;
    if (v61)
    {
      v65 = 0;
      v90 = (char *)v61;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v66 = (void (*)(char *, uint64_t))v94;
        v94((uint64_t)v63, AssociatedTypeWitness);
        v66(v64, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v65;
      }
      while (v90 != v65);
    }
    v67 = v88;
    v88(v62, v54);
    v68 = v74;
    v86(v74, v91, v60);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v70 = v85;
    MEMORY[0x2199FF9FC](v85, v68, v60, AssociatedConformanceWitness);
    v67(v68, v60);
    return ((uint64_t (*)(char *, uint64_t))v67)(v70, v60);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(char *, uint64_t), uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  void (*v59)(char *, char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  char *v75;
  void (*v76)(char *, uint64_t);
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  char *v79;
  char *v80;
  void (*v81)(char *, uint64_t);
  uint64_t result;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  void (*v90)(char *, uint64_t);
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  void (*v106)(char *, uint64_t);
  char *v107;

  v86 = a5;
  v88 = a4;
  v100 = a2;
  v101 = a3;
  v85 = a1;
  v90 = a7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v106 = *(void (**)(char *, uint64_t))(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v91 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v95 = (char *)&v83 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v83 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v94 = (char *)&v83 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v83 - v21;
  v84 = *(_QWORD *)(a6 - 8);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v104 = (char *)&v83 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v89 = (char *)&v83 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v92 = (char *)&v83 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v83 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  v103 = (char *)&v83 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v93 = (char *)&v83 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v83 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v83 - v39;
  dispatch thunk of SIMDStorage.init()();
  v99 = v38;
  v41 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v41 < 0)
    goto LABEL_22;
  v83 = v40;
  v102 = v31;
  v97 = AssociatedTypeWitness;
  v98 = a9;
  v107 = v22;
  v42 = v17;
  v43 = v94;
  if (v41)
  {
    v44 = 0;
    v96 = (char *)v41;
    do
    {
      v105 = v44 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      v45 = v97;
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      v46 = (void (*)(char *, uint64_t))*((_QWORD *)v106 + 1);
      v46(v42, v45);
      v46(v43, v45);
      dispatch thunk of SIMDStorage.subscript.setter();
      v44 = v105;
    }
    while (v96 != v105);
  }
  v87 = v42;
  v47 = v84;
  v48 = v83;
  v96 = *(char **)(v84 + 32);
  ((void (*)(char *, char *, uint64_t))v96)(v83, v99, a6);
  v49 = *(_QWORD *)(v98 + 16);
  SIMD<>.sum()(v49, v85);
  v90 = *(void (**)(char *, uint64_t))(v47 + 8);
  v90(v48, a6);
  v99 = (char *)v49;
  v50 = v97;
  v105 = *(char **)(v49 + 16);
  MEMORY[0x2199FF9A8](v86, v97);
  dispatch thunk of SIMDStorage.init()();
  v86 = a6;
  v51 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v51 < 0)
    goto LABEL_22;
  v53 = v87;
  v52 = v88;
  v54 = v94;
  v55 = v86;
  if (v51)
  {
    v56 = 0;
    v98 = v51;
    do
    {
      v57 = v52;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v58 = (void (*)(char *, uint64_t))*((_QWORD *)v106 + 1);
      v58(v53, v50);
      v58(v54, v50);
      dispatch thunk of SIMDStorage.subscript.setter();
      v52 = v57;
      ++v56;
    }
    while (v98 != v56);
  }
  ((void (*)(char *, char *, uint64_t))v96)(v103, v102, v55);
  v59 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v106 + 2);
  v59(v91, v95, v50);
  dispatch thunk of SIMDStorage.init()();
  v60 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v60 < 0)
    goto LABEL_22;
  v61 = v60;
  v62 = v91;
  v63 = v107;
  v64 = v89;
  v65 = v86;
  if (v60)
  {
    v66 = 0;
    do
    {
      v59(v63, v62, v50);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v66;
    }
    while (v61 != v66);
  }
  v67 = v50;
  v68 = (void (*)(char *, uint64_t))*((_QWORD *)v106 + 1);
  v68(v62, v50);
  ((void (*)(char *, char *, uint64_t))v96)(v92, v64, v65);
  dispatch thunk of SIMDStorage.init()();
  v69 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v69 < 0)
    goto LABEL_22;
  v70 = v65;
  v71 = v92;
  v106 = v68;
  v72 = v87;
  v73 = v94;
  v74 = v67;
  if (v69)
  {
    v75 = 0;
    v102 = (char *)v69;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      v76 = v106;
      v106(v72, v74);
      v76(v73, v74);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v75;
    }
    while (v102 != v75);
  }
  v77 = v90;
  v90(v71, v70);
  v77(v103, v70);
  v106(v95, v74);
  ((void (*)(char *, char *, uint64_t))v96)(v93, v104, v70);
  dispatch thunk of SIMDStorage.init()();
  v78 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v78 < 0)
  {
LABEL_22:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v79 = v93;
    if (v78)
    {
      v80 = 0;
      v104 = (char *)v78;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v81 = v106;
        v106(v72, v74);
        v81(v73, v74);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v80;
      }
      while (v104 != v80);
    }
    return ((uint64_t (*)(char *, uint64_t))v90)(v79, v70);
  }
  return result;
}

uint64_t (*static SIMD<>._vjpInit(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))@<X0>(uint64_t a1@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*result)@<X0>(uint64_t@<X8>);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v33 = a6;
  v34 = a7;
  v32 = a5;
  v29 = *(_QWORD *)(a3 - 8);
  v30 = a1;
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v27 - v16;
  v28 = v18;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v19((char *)&v27 - v16, a2, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v20 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v20 < 0)
  {
    result = (uint64_t (*)@<X0>(uint64_t@<X8>))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v21 = v20;
    if (v20)
    {
      v22 = 0;
      do
      {
        v19(v15, (uint64_t)v17, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v22;
      }
      while (v21 != v22);
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v17, AssociatedTypeWitness);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v30, v10, a3);
    v23 = (_QWORD *)swift_allocObject();
    v24 = v31;
    v23[2] = a3;
    v23[3] = v24;
    v25 = v33;
    v23[4] = v32;
    v23[5] = v25;
    v23[6] = v34;
    return partial apply for closure #1 in static SIMD<>._vjpInit(repeating:);
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD.init(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;

  static SIMD<>._vjpInit(repeating:)(a1, a2, a3, a4, a5, a6, a7);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a2, AssociatedTypeWitness);
  return partial apply for closure #1 in static SIMD<>._vjpInit(repeating:);
}

uint64_t (*static SIMD<>._jvpInit(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*result)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v33 = a6;
  v34 = a7;
  v32 = a5;
  v29 = *(_QWORD *)(a3 - 8);
  v30 = a1;
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v27 - v16;
  v28 = v18;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v19((char *)&v27 - v16, a2, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v20 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v20 < 0)
  {
    result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v21 = v20;
    if (v20)
    {
      v22 = 0;
      do
      {
        v19(v15, (uint64_t)v17, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v22;
      }
      while (v21 != v22);
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v17, AssociatedTypeWitness);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v30, v10, a3);
    v23 = (_QWORD *)swift_allocObject();
    v24 = v31;
    v23[2] = a3;
    v23[3] = v24;
    v25 = v33;
    v23[4] = v32;
    v23[5] = v25;
    v23[6] = v34;
    return partial apply for closure #1 in static SIMD<>._jvpInit(repeating:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpInit(repeating:)(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  v15 = v8;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v9((char *)&v14 - v6, a1, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  v10 = dispatch thunk of Sequence.underestimatedCount.getter();
  if (v10 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v11 = v10;
    if (v10)
    {
      v12 = 0;
      do
      {
        v9(v5, (uint64_t)v7, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v12;
      }
      while (v11 != v12);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v7, AssociatedTypeWitness);
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD.init(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  _QWORD *v16;
  uint64_t (*result)(uint64_t);

  static SIMD<>._jvpInit(repeating:)(a1, a2, a3, a4, a5, a6, a7);
  v14 = v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a2, AssociatedTypeWitness);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = a7;
  v16[7] = partial apply for closure #1 in static SIMD<>._jvpInit(repeating:);
  result = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.SIMDStorage.Scalar) -> (@out A);
  v16[8] = v14;
  return result;
}

void forward-mode derivative of FloatingPoint.addingProduct(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of FloatingPoint.squareRoot()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of static FloatingPoint.maximum(_:_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of SIMD2.subscript.setter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of SIMD4.subscript.setter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of SIMD8.subscript.setter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of SIMD16.subscript.setter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of SIMD32.subscript.setter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of SIMD64.subscript.setter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void forward-mode derivative of SIMD3.subscript.setter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

Swift::Void __swiftcall Array._checkSubscript_mutating(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  char isClassOrObjCExistentialType;
  uint64_t v5;

  v2 = v1;
  isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  if (a1 < 0)
    goto LABEL_5;
  v5 = v2 & 0xFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0)
    v5 = v2;
  if (*(_QWORD *)(v5 + 16) <= (unint64_t)a1)
  {
LABEL_5:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t sub_216C8CD18()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = (*(uint64_t (**)(void))(v0 + 32))();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_216C8CD48()
{
  return swift_deallocObject();
}

uint64_t sub_216C8CD5C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8CD6C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8CDB0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x24BEE2F68]);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A)(uint64_t a1)
{
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A)(a1);
}

{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 40);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_216C8CDE0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.- infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x24BEE2F70]);
}

uint64_t partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t type metadata accessor for Array<A>.DifferentiableView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Array<A>.DifferentiableView);
}

uint64_t sub_216C8CE98()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:)(uint64_t a1)
{
  uint64_t *v1;

  return pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:)(a1, v1[4], v1[5], v1[2]);
}

uint64_t sub_216C8CEC8()
{
  return swift_deallocObject();
}

uint64_t partial apply for differential #1 <A>(_:) in Array<A>._jvpSubscript(index:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;

  v3 = *(_QWORD *)(v1 + 32);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return Array<A>.DifferentiableView<>.subscript.getter(v3, a1, AssociatedTypeWitness);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A.Differentiable.TangentVector)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t partial apply for pullback #1 <A>(_:) in static Array<A>._vjpConcatenate(_:_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;

  v3 = v1[2];
  v4 = v1[4];
  v5 = v1[5];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = type metadata accessor for Array();
  swift_bridgeObjectRetain();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12E0], v7);
  if ((Collection.isEmpty.getter() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v8 = static Array._allocateUninitialized(_:)();
    static Array._allocateUninitialized(_:)();
    return v8;
  }
  v9 = MEMORY[0x2199FF81C](a1, AssociatedTypeWitness);
  v10 = MEMORY[0x2199FF81C](v4, v3);
  v11 = MEMORY[0x2199FF81C](v5, v3);
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v9 != v10 + v11)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    _StringGuts.grow(_:)(91);
    v14._object = (void *)0x8000000216C95BE0;
    v14._countAndFlagsBits = 0xD000000000000022;
    String.append(_:)(v14);
    v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = 0xD00000000000002ELL;
    v16._object = (void *)0x8000000216C95C10;
    String.append(_:)(v16);
    v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = 0x20646E6120;
    v18._object = (void *)0xE500000000000000;
    String.append(_:)(v18);
    v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_10;
  }
  if ((MEMORY[0x2199FF81C](v4, v3) & 0x8000000000000000) == 0)
  {
    Array.subscript.getter();
    v12 = type metadata accessor for ArraySlice();
    MEMORY[0x2199FFD80](MEMORY[0x24BEE2180], v12);
    v8 = Array.init<A>(_:)();
    swift_getCanonicalSpecializedMetadata();
    MEMORY[0x2199FFD80](MEMORY[0x24BEE12B8], v7);
    lazy protocol witness table accessor for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>();
    MutableCollection.subscript.getter();
    swift_bridgeObjectRelease();
    Array.init<A>(_:)();
    return v8;
  }
LABEL_10:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t objectdestroy_80Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for differential #1 <A>(_:_:) in static Array<A>._jvpConcatenate(_:_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;

  v1 = v0[2];
  v3 = v0[4];
  v2 = v0[5];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = swift_bridgeObjectRetain();
  v6 = MEMORY[0x2199FF81C](v5, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  if (v6 == MEMORY[0x2199FF81C](v3, v1)
    && (v7 = swift_bridgeObjectRetain(),
        v8 = MEMORY[0x2199FF81C](v7, AssociatedTypeWitness),
        swift_bridgeObjectRelease(),
        v8 == MEMORY[0x2199FF81C](v2, v1)))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = static Array.+ infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    _StringGuts.grow(_:)(82);
    v11._object = (void *)0x8000000216C95B90;
    v11._countAndFlagsBits = 0xD000000000000049;
    String.append(_:)(v11);
    v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = 0x20646E6120;
    v13._object = (void *)0xE500000000000000;
    String.append(_:)(v13);
    MEMORY[0x2199FF81C](v2, v1);
    v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_216C8D554()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Array<A>._vjpAppend(_:)()
{
  swift_getAssociatedTypeWitness();
  swift_bridgeObjectRetain();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  return $defer #1 <A>() in closure #1 in Array<A>._vjpAppend(_:)();
}

uint64_t sub_216C8D5FC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Array<A>._jvpAppend(_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in Array<A>._jvpAppend(_:)(a1, a2);
}

uint64_t sub_216C8D614()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in A.Differentiable.TangentVector, @inout [A.Differentiable.TangentVector]<A>.DifferentiableView) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t AssociatedTypeWitness;

  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(a2, a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_216C8D6A0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static Array<A>._vjpAppend(_:_:)()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = type metadata accessor for Array();
  swift_bridgeObjectRetain();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12E0], v1);
  Collection.dropFirst(_:)();
  v2 = type metadata accessor for ArraySlice();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE2180], v2);
  v3 = Array.init<A>(_:)();
  v4 = swift_bridgeObjectRetain();
  MEMORY[0x2199FF81C](v4, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12B0], v1);
  MEMORY[0x2199FFD80](MEMORY[0x24BEE12E8], v1);
  RangeReplaceableCollection<>.removeLast(_:)();
  return v3;
}

uint64_t sub_216C8D7E8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static Array<A>._jvpAppend(_:_:)()
{
  swift_getAssociatedTypeWitness();
  swift_bridgeObjectRetain();
  static Array.+= infix(_:_:)();
  return swift_bridgeObjectRelease();
}

uint64_t specialized Array.init(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v6 = static Array._allocateUninitialized(_:)();
  if (a2 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v8 = v6;
    if (a2)
    {
      v9 = v7;
      v10 = *(_QWORD *)(a3 - 8);
      v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
      do
      {
        v11(v9, a1, a3);
        v9 += *(_QWORD *)(v10 + 72);
        --a2;
      }
      while (a2);
    }
    type metadata accessor for Array();
    return v8;
  }
  return result;
}

uint64_t sub_216C8D93C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static Array<A>._vjpInit(repeating:count:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in static Array<A>._vjpInit(repeating:count:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_216C8D954()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static Array<A>._jvpInit(repeating:count:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;

  v3 = *(_QWORD *)(v1 + 32);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return specialized Array.init(repeating:count:)(a1, v3, AssociatedTypeWitness);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;

  v3 = (*(uint64_t (**)(void))(v1 + 32))();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  return v3;
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed A) -> (@out A1)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_216C8DA40()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A1.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t partial apply for specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:));
}

uint64_t partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector)(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48), a2);
}

uint64_t sub_216C8DAC0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:)(a1, a2, *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t partial apply for specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:)(a1, a2, *(_QWORD *)(v3 + 48), a3);
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector, @guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A1.Differentiable.TangentVector)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(a2, a1);
}

uint64_t sub_216C8DB30()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._vjpMultiply(lhs:rhs:)@<H0>(__n128 _Q0@<Q0>)
{
  uint64_t v1;
  __int16 result;

  _H1 = *(_WORD *)(v1 + 16);
  _H2 = *(_WORD *)(v1 + 18);
  __asm
  {
    FCVT            S3, H0
    FCVT            S0, H1
  }
  _S0 = _S0 * _S3;
  __asm
  {
    FCVT            H0, S0
    FCVT            S1, H2
  }
  _S1 = _S1 * _S3;
  __asm { FCVT            H1, S1 }
  return result;
}

uint64_t sub_216C8DB68()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DB78()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._jvpMultiply(lhs:rhs:)@<H0>(__n128 _Q0@<Q0>, __n128 _Q1@<Q1>)
{
  uint64_t v2;
  __int16 result;

  _H2 = *(_WORD *)(v2 + 16);
  _H3 = *(_WORD *)(v2 + 18);
  __asm
  {
    FCVT            S1, H1
    FCVT            S2, H2
  }
  _S1 = _S2 * _S1;
  __asm
  {
    FCVT            H1, S1
    FCVT            S0, H0
    FCVT            S2, H3
  }
  _S0 = _S2 * _S0;
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 + _S0;
  __asm { FCVT            H0, S0 }
  return result;
}

uint64_t sub_216C8DBC4()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DBD4()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._vjpMultiplyAssign(_:_:)@<H0>(__int16 *a1@<X0>)
{
  uint64_t v1;
  __int16 result;

  _H0 = *(_WORD *)(v1 + 16);
  _H1 = *(_WORD *)(v1 + 18);
  _H2 = *a1;
  __asm
  {
    FCVT            S2, H2
    FCVT            S0, H0
  }
  _S0 = _S0 * _S2;
  __asm
  {
    FCVT            H0, S0
    FCVT            S1, H1
  }
  _S1 = _S1 * _S2;
  __asm { FCVT            H1, S1 }
  *a1 = LOWORD(_S1);
  return result;
}

uint64_t sub_216C8DC14()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DC24()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._jvpMultiplyAssign(_:_:)@<H0>(__int16 *a1@<X0>, __n128 _Q0@<Q0>)
{
  uint64_t v2;
  __int16 result;

  _H1 = *(_WORD *)(v2 + 16);
  _H2 = *(_WORD *)(v2 + 18);
  _H3 = *a1;
  __asm
  {
    FCVT            S3, H3
    FCVT            S1, H1
  }
  _S1 = _S1 * _S3;
  __asm
  {
    FCVT            H1, S1
    FCVT            S0, H0
    FCVT            S2, H2
  }
  _S0 = _S2 * _S0;
  __asm
  {
    FCVT            H0, S0
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S0 = _S0 + _S1;
  __asm { FCVT            H0, S0 }
  *a1 = result;
  return result;
}

uint64_t sub_216C8DC78()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DC88()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DC9C()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._vjpDivide(lhs:rhs:)@<H0>(__n128 _Q0@<Q0>)
{
  uint64_t v1;
  __int16 result;

  _H1 = *(_WORD *)(v1 + 16);
  _H2 = *(_WORD *)(v1 + 18);
  __asm
  {
    FCVT            S1, H1
    FCVT            S3, H0
  }
  _S0 = _S3 / _S1;
  __asm
  {
    FCVT            H0, S0
    FCVT            S2, H2
  }
  _S2 = -_S2;
  __asm { FCVT            H2, S2 }
  _S1 = _S1 * _S1;
  __asm
  {
    FCVT            H1, S1
    FCVT            S1, H1
    FCVT            S2, H2
  }
  _S1 = _S2 / _S1;
  __asm
  {
    FCVT            H1, S1
    FCVT            S1, H1
  }
  _S1 = _S1 * _S3;
  __asm { FCVT            H1, S1 }
  return result;
}

uint64_t sub_216C8DCF8()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._jvpDivide(lhs:rhs:)@<H0>(__n128 _Q0@<Q0>, __n128 _Q1@<Q1>)
{
  uint64_t v2;
  __int16 result;

  _H2 = *(_WORD *)(v2 + 16);
  _H3 = *(_WORD *)(v2 + 18);
  __asm
  {
    FCVT            S0, H0
    FCVT            S2, H2
  }
  _S0 = _S0 / _S2;
  __asm { FCVT            H0, S0 }
  _S2 = _S2 * _S2;
  __asm
  {
    FCVT            H2, S2
    FCVT            S3, H3
    FCVT            S2, H2
  }
  _S2 = _S3 / _S2;
  __asm
  {
    FCVT            H2, S2
    FCVT            S2, H2
    FCVT            S1, H1
  }
  _S1 = _S2 * _S1;
  __asm
  {
    FCVT            H1, S1
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S0 - _S1;
  __asm { FCVT            H0, S0 }
  return result;
}

uint64_t sub_216C8DD5C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DD6C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DD80()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._vjpDivideAssign(_:_:)@<H0>(_WORD *a1@<X0>)
{
  uint64_t v1;
  __int16 result;

  _H0 = *(_WORD *)(v1 + 16);
  _H1 = *(_WORD *)(v1 + 18);
  __asm { FCVT            S0, H0 }
  _S0 = -_S0;
  __asm
  {
    FCVT            H0, S0
    FCVT            S1, H1
  }
  _S2 = _S1 * _S1;
  __asm
  {
    FCVT            H2, S2
    FCVT            S2, H2
    FCVT            S0, H0
  }
  _S0 = _S0 / _S2;
  __asm { FCVT            H0, S0 }
  LOWORD(_S2) = *a1;
  __asm
  {
    FCVT            S0, H0
    FCVT            S2, H2
  }
  _S0 = _S2 * _S0;
  __asm { FCVT            H0, S0 }
  _S1 = _S2 / _S1;
  __asm { FCVT            H1, S1 }
  *a1 = LOWORD(_S1);
  return result;
}

uint64_t sub_216C8DDE4()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DDF8()
{
  return swift_deallocObject();
}

__int16 partial apply for closure #1 in static Float16._jvpDivideAssign(_:_:)@<H0>(__int16 *a1@<X0>, __n128 _Q0@<Q0>)
{
  uint64_t v2;
  __int16 result;

  _H1 = *(_WORD *)(v2 + 16);
  _H2 = *(_WORD *)(v2 + 18);
  _H3 = *a1;
  __asm
  {
    FCVT            S3, H3
    FCVT            S1, H1
  }
  _S3 = _S1 * _S3;
  __asm
  {
    FCVT            H3, S3
    FCVT            S0, H0
    FCVT            S2, H2
  }
  _S0 = _S2 * _S0;
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
    FCVT            S2, H3
  }
  _S0 = _S2 - _S0;
  __asm { FCVT            H0, S0 }
  _S1 = _S1 * _S1;
  __asm
  {
    FCVT            H1, S1
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S0 / _S1;
  __asm { FCVT            H0, S0 }
  *a1 = result;
  return result;
}

uint64_t sub_216C8DE64()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._vjpMultiply(lhs:rhs:)(float a1)
{
  uint64_t v1;

  return *(float *)(v1 + 16) * a1;
}

uint64_t sub_216C8DE88()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DE98()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._jvpMultiply(lhs:rhs:)(float a1, float a2)
{
  uint64_t v2;

  return (float)(*(float *)(v2 + 16) * a2) + (float)(*(float *)(v2 + 20) * a1);
}

uint64_t sub_216C8DEBC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DECC()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._vjpMultiplyAssign(_:_:)(float *a1)
{
  uint64_t v1;
  float result;

  result = *(float *)(v1 + 16) * *a1;
  *a1 = *(float *)(v1 + 20) * *a1;
  return result;
}

uint64_t sub_216C8DEF4()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DF04()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._jvpMultiplyAssign(_:_:)(float *a1, float a2)
{
  uint64_t v2;
  float result;

  result = (float)(*(float *)(v2 + 20) * a2) + (float)(*(float *)(v2 + 16) * *a1);
  *a1 = result;
  return result;
}

uint64_t sub_216C8DF30()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DF40()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DF54()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._vjpDivide(lhs:rhs:)(float a1)
{
  uint64_t v1;

  return a1 / *(float *)(v1 + 16);
}

uint64_t sub_216C8DF84()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._jvpDivide(lhs:rhs:)(float a1, float a2)
{
  uint64_t v2;

  return (float)(a1 / *(float *)(v2 + 16))
       - (float)((float)(*(float *)(v2 + 20) / (float)(*(float *)(v2 + 16) * *(float *)(v2 + 16))) * a2);
}

uint64_t sub_216C8DFB0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DFC0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8DFD4()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._vjpDivideAssign(_:_:)(float *a1)
{
  uint64_t v1;
  float v2;
  float result;

  v2 = *(float *)(v1 + 20);
  result = *a1 * (float)((float)-*(float *)(v1 + 16) / (float)(v2 * v2));
  *a1 = *a1 / v2;
  return result;
}

uint64_t sub_216C8E008()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E01C()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in static Float._jvpDivideAssign(_:_:)(float *a1, float a2)
{
  uint64_t v2;
  float result;

  result = (float)((float)(*(float *)(v2 + 16) * *a1) - (float)(*(float *)(v2 + 20) * a2))
         / (float)(*(float *)(v2 + 16) * *(float *)(v2 + 16));
  *a1 = result;
  return result;
}

uint64_t sub_216C8E050()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._vjpMultiply(lhs:rhs:)(double a1)
{
  uint64_t v1;

  return *(double *)(v1 + 16) * a1;
}

uint64_t sub_216C8E074()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E084()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._jvpMultiply(lhs:rhs:)(double a1, double a2)
{
  uint64_t v2;

  return *(double *)(v2 + 16) * a2 + *(double *)(v2 + 24) * a1;
}

uint64_t sub_216C8E0A8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E0B8()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._vjpMultiplyAssign(_:_:)(double *a1)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 16) * *a1;
  *a1 = *(double *)(v1 + 24) * *a1;
  return result;
}

uint64_t sub_216C8E0E0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E0F0()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._jvpMultiplyAssign(_:_:)(double *a1, double a2)
{
  uint64_t v2;
  double result;

  result = *(double *)(v2 + 24) * a2 + *(double *)(v2 + 16) * *a1;
  *a1 = result;
  return result;
}

uint64_t sub_216C8E11C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E12C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E140()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._vjpDivide(lhs:rhs:)(double a1)
{
  uint64_t v1;

  return a1 / *(double *)(v1 + 16);
}

uint64_t sub_216C8E170()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._jvpDivide(lhs:rhs:)(double a1, double a2)
{
  uint64_t v2;

  return a1 / *(double *)(v2 + 16) - *(double *)(v2 + 24) / (*(double *)(v2 + 16) * *(double *)(v2 + 16)) * a2;
}

uint64_t sub_216C8E19C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E1AC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E1C0()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._vjpDivideAssign(_:_:)(double *a1)
{
  uint64_t v1;
  double v2;
  double result;

  v2 = *(double *)(v1 + 24);
  result = *a1 * (-*(double *)(v1 + 16) / (v2 * v2));
  *a1 = *a1 / v2;
  return result;
}

uint64_t sub_216C8E1F4()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E208()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in static Double._jvpDivideAssign(_:_:)(double *a1, double a2)
{
  uint64_t v2;
  double result;

  result = (*(double *)(v2 + 16) * *a1 - *(double *)(v2 + 24) * a2) / (*(double *)(v2 + 16) * *(double *)(v2 + 16));
  *a1 = result;
  return result;
}

uint64_t partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:));
}

uint64_t sub_216C8E24C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out A, @out A, @out A)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(a3, a1, a2);
}

uint64_t sub_216C8E2A8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E2B8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E2C8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in static FloatingPoint<>._vjpMaximum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #2 in static FloatingPoint<>._vjpMinimum(_:_:)(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_216C8E2F4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static FloatingPoint<>._vjpMaximum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in static FloatingPoint<>._vjpMinimum(_:_:)(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t partial apply for closure #1 in _jvpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  return closure #1 in _jvpFma<A>(_:_:_:)(a1, a2, a3, v3 + ((v6 + 40) & ~v6), v3 + ((*(_QWORD *)(v5 + 64) + v6 + ((v6 + 40) & ~v6)) & ~v6), v4);
}

uint64_t partial apply for closure #1 in _vjpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in _vjpFma<A>(_:_:_:));
}

uint64_t partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(v5 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  return a5(a1, a2, a3, a4, v5 + ((v7 + 40) & ~v7), v5 + ((*(_QWORD *)(v6 + 64) + v7 + ((v7 + 40) & ~v7)) & ~v7));
}

uint64_t partial apply for closure #1 in _vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:)(a1, a2, a3, MEMORY[0x24BEE38C8]);
}

uint64_t objectdestroy_324Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v3 + v4) & ~v3;
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  v6(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _vjpFmod<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:)(a1, a2, a3, MEMORY[0x24BEE38B8]);
}

uint64_t partial apply for closure #1 in _vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = v4[2];
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  return closure #1 in _vjpRemainder<A>(_:_:)(a1, a2, a3, (uint64_t)v4 + ((v7 + 40) & ~v7), (uint64_t)v4 + ((*(_QWORD *)(v6 + 64) + v7 + ((v7 + 40) & ~v7)) & ~v7), v5, v4[3], v4[4], a4);
}

uint64_t partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  return closure #1 in FloatingPoint<>._vjpSquareRoot()(a1, v2 + ((v4 + 40) & ~v4), v3, *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_216C8E4E0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _jvpCeil<A>(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in _jvpCeil<A>(_:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_216C8E50C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E51C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E52C()
{
  return swift_deallocObject();
}

uint64_t objectdestroy_330Tm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_216C8E598()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E5A8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E5B8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E5C8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E5D8()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpFma(_:_:_:)(double a1, double a2, double a3)
{
  uint64_t v3;

  return *(double *)(v3 + 16) * a1 + *(double *)(v3 + 24) * a2 + a3;
}

uint64_t sub_216C8E600()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E610()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _vjpFma(_:_:_:)(double a1)
{
  uint64_t v1;

  return *(double *)(v1 + 16) * a1;
}

uint64_t sub_216C8E634()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E644()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E668()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E678()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E69C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E6AC()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpSqrt(_:)(double a1)
{
  uint64_t v1;

  return a1 / (*(double *)(v1 + 16) + *(double *)(v1 + 16));
}

uint64_t sub_216C8E6CC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E6DC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E6EC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E6FC()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpExp(_:)(float a1)
{
  uint64_t v1;

  return *(float *)(v1 + 16) * a1;
}

uint64_t sub_216C8E718()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E728()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpExp2(_:)(float a1)
{
  uint64_t v1;

  return (float)(a1 * 0.69315) * *(float *)(v1 + 16);
}

uint64_t sub_216C8E754()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E764()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpLog(_:)(float a1)
{
  uint64_t v1;

  return a1 / *(float *)(v1 + 16);
}

uint64_t sub_216C8E780()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E790()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpLog10(_:)(float a1)
{
  uint64_t v1;

  return (float)(a1 * 0.43429) / *(float *)(v1 + 16);
}

uint64_t sub_216C8E7BC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E7CC()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpLog2(_:)(float a1)
{
  uint64_t v1;

  return a1 / (float)(*(float *)(v1 + 16) * 0.69315);
}

uint64_t sub_216C8E7F8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E808()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpSin(_:)(float a1)
{
  uint64_t v1;

  return cosf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_216C8E840()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E850()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpCos(_:)(float a1)
{
  uint64_t v1;

  return -(float)(a1 * sinf(*(float *)(v1 + 16)));
}

uint64_t sub_216C8E888()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E898()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpTan(_:)(float a1)
{
  uint64_t v1;

  return (float)((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + 1.0) * a1;
}

uint64_t sub_216C8E8C0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E8D0()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpAsin(_:)(float a1)
{
  uint64_t v1;

  return a1 / sqrtf(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_216C8E8FC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E90C()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpAcos(_:)(float a1)
{
  uint64_t v1;

  return (float)-a1 / sqrtf(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_216C8E93C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E94C()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpAtan(_:)(float a1)
{
  uint64_t v1;

  return a1 / (float)((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + 1.0);
}

uint64_t sub_216C8E974()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E984()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpSinh(_:)(float a1)
{
  uint64_t v1;

  return coshf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_216C8E9BC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8E9CC()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpCosh(_:)(float a1)
{
  uint64_t v1;

  return sinhf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_216C8EA04()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EA14()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpTanh(_:)(float a1)
{
  uint64_t v1;

  return (float)(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16))) * a1;
}

uint64_t sub_216C8EA3C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EA4C()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpAsinh(_:)(float a1)
{
  uint64_t v1;

  return a1 / sqrtf((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + 1.0);
}

uint64_t sub_216C8EA78()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EA88()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpAcosh(_:)(float a1)
{
  uint64_t v1;

  return a1 / sqrtf((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + -1.0);
}

uint64_t sub_216C8EAB4()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EAC4()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpAtanh(_:)(float a1)
{
  uint64_t v1;

  return a1 / (float)(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_216C8EAEC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EAFC()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpExpm1(_:)(float a1)
{
  uint64_t v1;

  return expf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_216C8EB34()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EB44()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpLog1p(_:)(float a1)
{
  uint64_t v1;

  return a1 / (float)(*(float *)(v1 + 16) + 1.0);
}

uint64_t sub_216C8EB68()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EB78()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpErf(_:)(float a1)
{
  uint64_t v1;

  return (float)(a1 * 1.1284) * expf(-(float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_216C8EBC0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EBD0()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpErfc(_:)(float a1)
{
  uint64_t v1;

  return (float)(a1 * -1.1284) * expf(-(float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_216C8EC18()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EC28()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpExp(_:)(double a1)
{
  uint64_t v1;

  return *(double *)(v1 + 16) * a1;
}

uint64_t sub_216C8EC44()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EC54()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpExp2(_:)(double a1)
{
  uint64_t v1;

  return a1 * 0.693147181 * *(double *)(v1 + 16);
}

uint64_t sub_216C8EC7C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EC8C()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpLog(_:)(double a1)
{
  uint64_t v1;

  return a1 / *(double *)(v1 + 16);
}

uint64_t sub_216C8ECA8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8ECB8()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpLog10(_:)(double a1)
{
  uint64_t v1;

  return a1 * 0.434294482 / *(double *)(v1 + 16);
}

uint64_t sub_216C8ECE0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8ECF0()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpLog2(_:)(double a1)
{
  uint64_t v1;

  return a1 / (*(double *)(v1 + 16) * 0.693147181);
}

uint64_t sub_216C8ED18()
{
  return swift_deallocObject();
}

uint64_t sub_216C8ED28()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpSin(_:)(double a1)
{
  uint64_t v1;

  return cos(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_216C8ED60()
{
  return swift_deallocObject();
}

uint64_t sub_216C8ED70()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpCos(_:)(double a1)
{
  uint64_t v1;

  return -(a1 * sin(*(long double *)(v1 + 16)));
}

uint64_t sub_216C8EDA8()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EDB8()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpTan(_:)(double a1)
{
  uint64_t v1;

  return (*(double *)(v1 + 16) * *(double *)(v1 + 16) + 1.0) * a1;
}

uint64_t sub_216C8EDE0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EDF0()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpAsin(_:)(double a1)
{
  uint64_t v1;

  return a1 / sqrt(1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16));
}

uint64_t sub_216C8EE1C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EE2C()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpAcos(_:)(double a1)
{
  uint64_t v1;

  return -a1 / sqrt(1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16));
}

uint64_t sub_216C8EE5C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EE6C()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpAtan(_:)(double a1)
{
  uint64_t v1;

  return a1 / (*(double *)(v1 + 16) * *(double *)(v1 + 16) + 1.0);
}

uint64_t sub_216C8EE94()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EEA4()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpSinh(_:)(double a1)
{
  uint64_t v1;

  return cosh(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_216C8EEDC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EEEC()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpCosh(_:)(double a1)
{
  uint64_t v1;

  return sinh(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_216C8EF24()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EF34()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpTanh(_:)(double a1)
{
  uint64_t v1;

  return (1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16)) * a1;
}

uint64_t sub_216C8EF5C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EF6C()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpAsinh(_:)(double a1)
{
  uint64_t v1;

  return a1 / sqrt(*(double *)(v1 + 16) * *(double *)(v1 + 16) + 1.0);
}

uint64_t sub_216C8EF98()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EFA8()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpAcosh(_:)(double a1)
{
  uint64_t v1;

  return a1 / sqrt(*(double *)(v1 + 16) * *(double *)(v1 + 16) + -1.0);
}

uint64_t sub_216C8EFD4()
{
  return swift_deallocObject();
}

uint64_t sub_216C8EFE4()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpAtanh(_:)(double a1)
{
  uint64_t v1;

  return a1 / (1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16));
}

uint64_t sub_216C8F00C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F01C()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpExpm1(_:)(double a1)
{
  uint64_t v1;

  return exp(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_216C8F054()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F064()
{
  return swift_deallocObject();
}

double partial apply for closure #1 in _jvpLog1p(_:)(double a1)
{
  uint64_t v1;

  return a1 / (*(double *)(v1 + 16) + 1.0);
}

uint64_t sub_216C8F088()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F098()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpErf(_:)(double a1)
{
  uint64_t v1;

  return a1 * 1.12837917 * exp(-(*(double *)(v1 + 16) * *(double *)(v1 + 16)));
}

uint64_t sub_216C8F0DC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F0EC()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpErfc(_:)(double a1)
{
  uint64_t v1;

  return a1 * -1.12837917 * exp(-(*(double *)(v1 + 16) * *(double *)(v1 + 16)));
}

uint64_t sub_216C8F130()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F140()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F150()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F160()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F170()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F180()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F190()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F1A0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F1B0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F1C0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F1D0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F1E0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F1F0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F200()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F210()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F220()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F230()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F240()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F250()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F260()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F270()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F280()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F290()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F2A0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F2B0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F2C0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F2D0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F2E0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F2F0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F300()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F310()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F320()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F330()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F340()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F350()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F360()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F370()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F380()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F390()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F3A0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F3B0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F3C0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F3D0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F3E0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F3F0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F400()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F410()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F420()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F430()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F440()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F450()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F460()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F470()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F480()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F490()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F4A0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F4B0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F4C0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F4D0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F4E0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F4F0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F500()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F510()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F520()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F530()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F540()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F550()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F560()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F570()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F580()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F590()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F5A0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F5B0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F5C0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F5D0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F5E0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F5F0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F600()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F610()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F620()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F630()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F640()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F650()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F660()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F670()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F680()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F694()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _vjpPow(_:_:)(float a1)
{
  uint64_t v1;
  float v3;
  float v4;
  float v5;
  float v6;

  v3 = *(float *)(v1 + 20);
  if (v3 > 0.0)
    v5 = *(float *)(v1 + 20);
  else
    v5 = 1.0;
  v4 = *(float *)(v1 + 16);
  v6 = (float)(v4 * a1) * powf(v3, v4 + -1.0);
  logf(v5);
  return v6;
}

uint64_t sub_216C8F704()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F718()
{
  return swift_deallocObject();
}

float partial apply for closure #1 in _jvpPow(_:_:)(float a1, float a2)
{
  float *v2;
  float v4;
  float v5;
  float v6;
  float v7;

  v5 = v2[6];
  if (v2[5] > 0.0)
    v6 = v2[5];
  else
    v6 = 1.0;
  v4 = v2[4];
  v7 = (float)(v4 * a1) * powf(v2[5], v4 + -1.0);
  return v7 + (float)((float)(v5 * a2) * logf(v6));
}

uint64_t sub_216C8F78C()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F7A0()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _vjpPow(_:_:)(double a1)
{
  uint64_t v1;
  long double v3;
  double v4;
  double v5;
  long double v6;

  v3 = *(double *)(v1 + 24);
  if (v3 > 0.0)
    v5 = *(double *)(v1 + 24);
  else
    v5 = 1.0;
  v4 = *(double *)(v1 + 16);
  v6 = v4 * a1 * pow(v3, v4 + -1.0);
  log(v5);
  return v6;
}

uint64_t sub_216C8F810()
{
  return swift_deallocObject();
}

uint64_t sub_216C8F824()
{
  return swift_deallocObject();
}

long double partial apply for closure #1 in _jvpPow(_:_:)(double a1, double a2)
{
  double *v2;
  double v4;
  double v5;
  double v6;
  long double v7;

  v5 = v2[4];
  if (v2[3] > 0.0)
    v6 = v2[3];
  else
    v6 = 1.0;
  v4 = v2[2];
  v7 = v4 * a1 * pow(v2[3], v4 + -1.0);
  return v7 + v5 * a2 * log(v6);
}

uint64_t sub_216C8F898()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD2<>._vjpSubscript(_:));
}

uint64_t sub_216C8F8B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_216C8F8D8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD2<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD2<>._jvpSubscript(index:));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SIMD2<A>) -> (@out A)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_216C8F914()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_216C8F930()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD4<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD4<>._vjpSubscript(_:));
}

uint64_t sub_216C8F94C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD4<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD4<>._jvpSubscript(index:));
}

uint64_t sub_216C8F968()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_216C8F984()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD8<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD8<>._vjpSubscript(_:));
}

uint64_t sub_216C8F9A0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD8<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD8<>._jvpSubscript(index:));
}

uint64_t sub_216C8F9BC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_216C8F9D8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD16<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD16<>._vjpSubscript(_:));
}

uint64_t sub_216C8F9F4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD16<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD16<>._jvpSubscript(index:));
}

uint64_t sub_216C8FA10()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_216C8FA2C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD32<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD32<>._vjpSubscript(_:));
}

uint64_t sub_216C8FA48()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD32<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD32<>._jvpSubscript(index:));
}

uint64_t sub_216C8FA64()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_216C8FA80()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD64<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD64<>._vjpSubscript(_:));
}

uint64_t sub_216C8FA9C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD64<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD64<>._jvpSubscript(index:));
}

uint64_t sub_216C8FAB8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_216C8FAD4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD3<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD3<>._vjpSubscript(_:));
}

uint64_t sub_216C8FAF0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD3<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD3<>._jvpSubscript(index:));
}

uint64_t sub_216C8FB0C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_216C8FB28()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16);
  v8(a1, a3, AssociatedTypeWitness);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v8)(a2, a3, AssociatedTypeWitness);
}

{
  uint64_t v3;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;

  v7 = *(_QWORD *)(v3 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  SIMD<>.sum()(*(_QWORD *)(v7 + 16), a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, a3, AssociatedTypeWitness);
}

{
  uint64_t v3;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;

  v7 = *(_QWORD *)(v3 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, a3, AssociatedTypeWitness);
  return SIMD<>.sum()(*(_QWORD *)(v7 + 16), a2);
}

uint64_t sub_216C8FBC0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE2F68]);
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, (uint64_t)MEMORY[0x24BEE2F68], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, (uint64_t)MEMORY[0x24BEE2F68], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

uint64_t sub_216C8FBDC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
}

uint64_t sub_216C8FC18()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE2F70]);
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, (uint64_t)MEMORY[0x24BEE2F70], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, (uint64_t)MEMORY[0x24BEE2F70], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v3;

  return closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], a3);
}

uint64_t sub_216C8FC64()
{
  return swift_deallocObject();
}

uint64_t sub_216C8FC78()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return closure #1 in static SIMD<>._vjpNegate(rhs:)(a1, *(_QWORD *)(v2 + 56), a2);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpDivide(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(*(_QWORD *)(v4 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  return a4(a1, a2, a3, v4 + ((v6 + 48) & ~v6), v4 + ((*(_QWORD *)(v5 + 64) + v6 + ((v6 + 48) & ~v6)) & ~v6));
}

uint64_t objectdestroy_1189Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v3 + v4) & ~v3;
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  v6(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpDivide(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  return a3(a1, a2, v3 + ((v5 + 48) & ~v5), v3 + ((*(_QWORD *)(v4 + 64) + v5 + ((v5 + 48) & ~v5)) & ~v5));
}

uint64_t sub_216C8FDF0()
{
  return swift_deallocObject();
}

uint64_t sub_216C8FE84()
{
  return swift_deallocObject();
}

uint64_t sub_216C8FEA8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:));
}

uint64_t sub_216C8FEC4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))
{
  _QWORD *v4;

  return a4(a1, a2, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7], v4[8], a3);
}

uint64_t sub_216C8FF20()
{
  return swift_deallocObject();
}

uint64_t sub_216C8FFBC()
{
  return swift_deallocObject();
}

uint64_t sub_216C8FFE0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v4;

  return a4(a1, a2, a3, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7], v4[8]);
}

uint64_t sub_216C90030()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v9 = *((_QWORD *)v4 + 2);
  v10 = *((_QWORD *)v4 + 3);
  v11 = *((_QWORD *)v4 + 4);
  v12 = *((_QWORD *)v4 + 5);
  v13 = *((_QWORD *)v4 + 6);
  v14 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v15 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v16 = *(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80);
  return a4(a1, a2, a3, &v4[v15], &v4[(v15 + *(_QWORD *)(v14 + 64) + v16) & ~v16], v9, v10, v11, v12, v13);
}

{
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v7 = *((_QWORD *)v4 + 2);
  v8 = *((_QWORD *)v4 + 3);
  v9 = *((_QWORD *)v4 + 4);
  v10 = *((_QWORD *)v4 + 5);
  v11 = *((_QWORD *)v4 + 6);
  v12 = *(_QWORD *)(v7 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = v13 + *(_QWORD *)(v12 + 64);
  v15 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  return a4(a1, a2, a3, &v4[v13], &v4[(v14 + v15) & ~v15], v7, v8, v9, v10, v11);
}

uint64_t objectdestroy_1225Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v1 - 8);
  v6 = (v4 + *(_QWORD *)(v3 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, AssociatedTypeWitness);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v7 = *((_QWORD *)v3 + 2);
  v8 = *((_QWORD *)v3 + 3);
  v9 = *((_QWORD *)v3 + 4);
  v10 = *((_QWORD *)v3 + 5);
  v11 = *((_QWORD *)v3 + 6);
  v12 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
  return a3(a1, a2, &v3[v13], &v3[(v13 + *(_QWORD *)(v12 + 64) + v14) & ~v14], v7, v8, v9, v10, v11);
}

uint64_t objectdestroy_1228Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = *((_QWORD *)v3 + 2);
  v6 = *((_QWORD *)v3 + 3);
  v7 = *((_QWORD *)v3 + 4);
  v8 = *((_QWORD *)v3 + 5);
  v9 = *((_QWORD *)v3 + 6);
  v10 = *(_QWORD *)(v5 - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = v11 + *(_QWORD *)(v10 + 64);
  v13 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  return a3(a1, a2, &v3[v11], &v3[(v12 + v13) & ~v13], v5, v6, v7, v8, v9);
}

uint64_t sub_216C90578()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpInit(repeating:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return SIMD<>.sum()(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 16), a1);
}

uint64_t sub_216C905B8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpInit(repeating:)(uint64_t a1)
{
  return closure #1 in static SIMD<>._jvpInit(repeating:)(a1);
}

uint64_t sub_216C905D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.SIMDStorage.Scalar) -> (@out A)(uint64_t a1)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  (*(void (**)(void))(v1 + 56))();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

unint64_t lazy protocol witness table accessor for type AnyDerivative and conformance AnyDerivative()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative;
  if (!lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative)
  {
    result = MEMORY[0x2199FFD80](&protocol conformance descriptor for AnyDerivative, &type metadata for AnyDerivative);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative;
  if (!lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative)
  {
    result = MEMORY[0x2199FFD80](&protocol conformance descriptor for AnyDerivative, &type metadata for AnyDerivative);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative;
  if (!lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative)
  {
    result = MEMORY[0x2199FFD80](&protocol conformance descriptor for AnyDerivative, &type metadata for AnyDerivative);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative);
  }
  return result;
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in [A]<A>.DifferentiableView(uint64_t a1)
{
  uint64_t AssociatedConformanceWitness;

  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> [A]<A>.DifferentiableView, a1, &AssociatedConformanceWitness);
}

void associated type witness table accessor for Differentiable.TangentVector : Differentiable in [A]<A>.DifferentiableView()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t base witness table accessor for Equatable in <> [A]<A>.DifferentiableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> [A]<A>.DifferentiableView, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <A> [A](uint64_t a1)
{
  uint64_t AssociatedConformanceWitness;

  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> [A]<A>.DifferentiableView, a1, &AssociatedConformanceWitness);
}

void associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in A?<A>.TangentVector()
{
  JUMPOUT(0x2199FFD80);
}

void associated type witness table accessor for Differentiable.TangentVector : Differentiable in A?<A>.TangentVector()
{
  JUMPOUT(0x2199FFD80);
}

void base witness table accessor for Equatable in A?<A>.TangentVector()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in Float16()
{
  return MEMORY[0x24BEE4690];
}

_UNKNOWN **associated type witness table accessor for Differentiable.TangentVector : Differentiable in Float16()
{
  return &protocol witness table for Float16;
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in Float()
{
  return MEMORY[0x24BEE1548];
}

_UNKNOWN **associated type witness table accessor for Differentiable.TangentVector : Differentiable in Float()
{
  return &protocol witness table for Float;
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in Double()
{
  return MEMORY[0x24BEE1428];
}

_UNKNOWN **associated type witness table accessor for Differentiable.TangentVector : Differentiable in Double()
{
  return &protocol witness table for Double;
}

void base witness table accessor for Equatable in <> SIMD2<A>()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 16);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> SIMD2<A>, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(a1, a2, a3, (uint64_t)&protocol conformance descriptor for <> SIMD2<A>);
}

void base witness table accessor for Equatable in <> SIMD4<A>()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD4<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 16);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> SIMD4<A>, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD4<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(a1, a2, a3, (uint64_t)&protocol conformance descriptor for <> SIMD4<A>);
}

void base witness table accessor for Equatable in <> SIMD8<A>()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 16);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> SIMD8<A>, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(a1, a2, a3, (uint64_t)&protocol conformance descriptor for <> SIMD8<A>);
}

void base witness table accessor for Equatable in <> SIMD16<A>()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 16);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> SIMD16<A>, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(a1, a2, a3, (uint64_t)&protocol conformance descriptor for <> SIMD16<A>);
}

void base witness table accessor for Equatable in <> SIMD32<A>()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 16);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> SIMD32<A>, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(a1, a2, a3, (uint64_t)&protocol conformance descriptor for <> SIMD32<A>);
}

void base witness table accessor for Equatable in <> SIMD64<A>()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 16);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> SIMD64<A>, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(a1, a2, a3, (uint64_t)&protocol conformance descriptor for <> SIMD64<A>);
}

void base witness table accessor for Equatable in <> SIMD3<A>()
{
  JUMPOUT(0x2199FFD80);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 16);
  return MEMORY[0x2199FFD80](&protocol conformance descriptor for <> SIMD3<A>, a1, &v4);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(a1, a2, a3, (uint64_t)&protocol conformance descriptor for <> SIMD3<A>);
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int8x16_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a3 - 24);
  v6 = vextq_s8(*(int8x16_t *)(a3 - 16), *(int8x16_t *)(a3 - 16), 8uLL);
  v7 = v4;
  return MEMORY[0x2199FFD80](a4, a1, &v6);
}

uint64_t sub_216C90BBC()
{
  return 16;
}

__n128 sub_216C90BC8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of Differentiable.move(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t *assignWithCopy for AnyDifferentiable(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AnyDifferentiable()
{
  return &type metadata for AnyDifferentiable;
}

uint64_t dispatch thunk of _AnyDerivativeBox._isEqual(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._isNotEqual(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static _AnyDerivativeBox._zero.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._adding(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._subtracting(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._move(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._typeErasedBase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._unboxed<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t type metadata instantiation function for _ConcreteDerivativeBox()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t initializeWithCopy for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t assignWithCopy for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t initializeWithTake for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t assignWithTake for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for AnyDerivative(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for AnyDerivative(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t assignWithTake for AnyDerivative(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyDifferentiable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyDifferentiable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyDerivative()
{
  return &type metadata for AnyDerivative;
}

ValueMetadata *type metadata accessor for AnyDerivative.OpaqueZero()
{
  return &type metadata for AnyDerivative.OpaqueZero;
}

uint64_t type metadata completion function for Optional<A>.TangentVector()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional<A>.TangentVector(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  int v6;
  size_t v7;
  uint64_t v10;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (*(_DWORD *)(v5 + 84))
    v7 = *(_QWORD *)(v5 + 64);
  else
    v7 = *(_QWORD *)(v5 + 64) + 1;
  if (*(_DWORD *)(v5 + 80) > 7u || (v6 & 0x100000) != 0 || v7 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v11 = AssociatedTypeWitness;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v11);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for Optional<A>.TangentVector(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t result;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, AssociatedTypeWitness);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  return result;
}

void *initializeWithCopy for Optional<A>.TangentVector(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  size_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84))
      v6 = *(_QWORD *)(v5 + 64);
    else
      v6 = *(_QWORD *)(v5 + 64) + 1;
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *assignWithCopy for Optional<A>.TangentVector(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  size_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, AssociatedTypeWitness);
  v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v5 + 84))
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

void *initializeWithTake for Optional<A>.TangentVector(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  size_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84))
      v6 = *(_QWORD *)(v5 + 64);
    else
      v6 = *(_QWORD *)(v5 + 64) + 1;
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *assignWithTake for Optional<A>.TangentVector(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  size_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, AssociatedTypeWitness);
  v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v5 + 84))
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional<A>.TangentVector(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v13;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  if (a2 > v6)
  {
    v8 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v10 = ((a2 - v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (v9)
        goto LABEL_15;
    }
    else
    {
      if (v10 <= 0xFF)
      {
        if (v10 < 2)
          goto LABEL_22;
LABEL_8:
        v9 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_22;
LABEL_15:
        v11 = (v9 - 1) << v8;
        if (v7 > 3)
          v11 = 0;
        if ((_DWORD)v7)
        {
          if (v7 > 3)
            LODWORD(v7) = 4;
          __asm { BR              X12 }
        }
        return v6 + v11 + 1;
      }
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_22:
  if (v5 < 2)
    return 0;
  v13 = (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
  if (v13 >= 2)
    return v13 - 1;
  else
    return 0;
}

void storeEnumTagSinglePayload for Optional<A>.TangentVector(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v6 = 0;
  v7 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  if (a3 > v9)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 >= a2)
LABEL_20:
        __asm { BR              X11 }
LABEL_13:
      v12 = ~v9 + a2;
      if (v10 < 4)
      {
        if ((_DWORD)v10)
        {
          v13 = v12 & ~(-1 << (8 * v10));
          bzero(a1, v10);
          if ((_DWORD)v10 == 3)
          {
            *(_WORD *)a1 = v13;
            a1[2] = BYTE2(v13);
          }
          else if ((_DWORD)v10 == 2)
          {
            *(_WORD *)a1 = v13;
          }
          else
          {
            *a1 = v13;
          }
        }
      }
      else
      {
        bzero(a1, v10);
        *(_DWORD *)a1 = v12;
      }
      __asm { BR              X10 }
    }
    v11 = ((a3 - v9 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v11))
    {
      v6 = 4u;
      if (v9 >= a2)
        goto LABEL_20;
      goto LABEL_13;
    }
    if (v11 >= 0x100)
      v6 = 2;
    else
      v6 = v11 > 1;
  }
  if (v9 >= a2)
    goto LABEL_20;
  goto LABEL_13;
}

void sub_216C91730()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_216C91738()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t type metadata accessor for Optional<A>.TangentVector(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Optional<A>.TangentVector);
}

uint64_t type metadata completion function for _ConcreteDerivativeBox()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _ConcreteDerivativeBox(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t getEnumTagSinglePayload for _ConcreteDerivativeBox(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_216C918F4 + 4 * byte_216C9277E[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for _ConcreteDerivativeBox(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t outlined destroy of AnyDerivative(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t partial apply for closure #1 in differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA(uint64_t a1, uint64_t a2)
{
  return _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTATm(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))_s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR);
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA(uint64_t a1, uint64_t a2)
{
  return _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTATm(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))_s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR);
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTATm(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))
{
  _QWORD *v3;

  return a3(a1, v3[6], v3[7], v3[2], v3[3], v3[4], v3[5], a2);
}

uint64_t partial apply for implicit closure #1 in closure #1 in static Array<A>._vjpInit(repeating:count:)(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return MEMORY[0x2199FF9FC](a1, a2, AssociatedTypeWitness, AssociatedConformanceWitness);
}

unint64_t lazy protocol witness table accessor for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>()
{
  unint64_t result;
  uint64_t CanonicalSpecializedMetadata;

  result = lazy protocol witness table cache variable for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>;
  if (!lazy protocol witness table cache variable for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>)
  {
    CanonicalSpecializedMetadata = swift_getCanonicalSpecializedMetadata();
    result = MEMORY[0x2199FFD80](MEMORY[0x24BEE2C50], CanonicalSpecializedMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>);
  }
  return result;
}

uint64_t outlined init with copy of AnyDerivative(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199FFD50](a1, v6, a5);
}

void forward-mode derivative of static FloatingPoint.minimum(_:_:)()
{
  forward-mode derivative of static FloatingPoint.maximum(_:_:)();
}

uint64_t dispatch thunk of BinaryFloatingPoint.init<A>(_:)()
{
  return MEMORY[0x24BEE0260]();
}

uint64_t dispatch thunk of FloatingPoint.squareRoot()()
{
  return MEMORY[0x24BEE0518]();
}

uint64_t dispatch thunk of FloatingPoint.addingProduct(_:_:)()
{
  return MEMORY[0x24BEE0530]();
}

uint64_t dispatch thunk of FloatingPoint.truncatingRemainder(dividingBy:)()
{
  return MEMORY[0x24BEE0540]();
}

uint64_t dispatch thunk of static FloatingPoint./ infix(_:_:)()
{
  return MEMORY[0x24BEE0548]();
}

uint64_t dispatch thunk of FloatingPoint.isNaN.getter()
{
  return MEMORY[0x24BEE0590]();
}

uint64_t dispatch thunk of FloatingPoint.rounded(_:)()
{
  return MEMORY[0x24BEE05A8]();
}

uint64_t dispatch thunk of FloatingPoint.remainder(dividingBy:)()
{
  return MEMORY[0x24BEE05D8]();
}

uint64_t dispatch thunk of FloatingPoint.init(_:)()
{
  return MEMORY[0x24BEE05E8]();
}

uint64_t BidirectionalCollection.reversed()()
{
  return MEMORY[0x24BEE07B0]();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t MutableCollection.subscript.getter()
{
  return MEMORY[0x24BEE0850]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x24BEE0A10]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t Sequence.reversed()()
{
  return MEMORY[0x24BEE0EF0]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t Array.customMirror.getter()
{
  return MEMORY[0x24BEE1130]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x24BEE1140]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE1150](a1);
}

uint64_t static Array.+ infix(_:_:)()
{
  return MEMORY[0x24BEE1170]();
}

Swift::Void __swiftcall Array._makeMutableAndUnique()()
{
  MEMORY[0x24BEE1178]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t static Array.+= infix(_:_:)()
{
  return MEMORY[0x24BEE11A8]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t static Array<A>.== infix(_:_:)()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x24BEE1290]();
}

{
  return MEMORY[0x24BEE1308]();
}

uint64_t dispatch thunk of static Numeric.* infix(_:_:)()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t Collection.dropFirst(_:)()
{
  return MEMORY[0x24BEE19D0]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t RangeReplaceableCollection<>.removeLast()()
{
  return MEMORY[0x24BEE1B10]();
}

uint64_t RangeReplaceableCollection<>.removeLast(_:)()
{
  return MEMORY[0x24BEE1B18]();
}

uint64_t Optional.customMirror.getter()
{
  return MEMORY[0x24BEE1C50]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t dispatch thunk of SIMDStorage.scalarCount.getter()
{
  return MEMORY[0x24BEE2468]();
}

uint64_t dispatch thunk of SIMDStorage.init()()
{
  return MEMORY[0x24BEE2488]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.getter()
{
  return MEMORY[0x24BEE2490]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.setter()
{
  return MEMORY[0x24BEE2498]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t Zip2Sequence.makeIterator()()
{
  return MEMORY[0x24BEE25F0]();
}

uint64_t Zip2Sequence.Iterator.next()()
{
  return MEMORY[0x24BEE25F8]();
}

uint64_t type metadata accessor for Zip2Sequence.Iterator()
{
  return MEMORY[0x24BEE2600]();
}

uint64_t type metadata accessor for Zip2Sequence()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t dispatch thunk of static SignedNumeric.- prefix(_:)()
{
  return MEMORY[0x24BEE27E0]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2950](a1);
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.- infix(_:_:)()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+= infix(_:_:)()
{
  return MEMORY[0x24BEE2F78]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.zero.getter()
{
  return MEMORY[0x24BEE2F88]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t zip<A, B>(_:_:)()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

long double acosh(long double __x)
{
  long double result;

  MEMORY[0x24BDAD118](__x);
  return result;
}

float acoshf(float a1)
{
  float result;

  MEMORY[0x24BDAD120](a1);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

long double asinh(long double __x)
{
  long double result;

  MEMORY[0x24BDAD198](__x);
  return result;
}

float asinhf(float a1)
{
  float result;

  MEMORY[0x24BDAD1A0](a1);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

long double atanh(long double __x)
{
  long double result;

  MEMORY[0x24BDAD238](__x);
  return result;
}

float atanhf(float a1)
{
  float result;

  MEMORY[0x24BDAD240](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

long double cosh(long double __x)
{
  long double result;

  MEMORY[0x24BDADBF0](__x);
  return result;
}

float coshf(float a1)
{
  float result;

  MEMORY[0x24BDADBF8](a1);
  return result;
}

long double erf(long double __x)
{
  long double result;

  MEMORY[0x24BDAE1A8](__x);
  return result;
}

long double erfc(long double __x)
{
  long double result;

  MEMORY[0x24BDAE1B0](__x);
  return result;
}

float erfcf(float a1)
{
  float result;

  MEMORY[0x24BDAE1B8](a1);
  return result;
}

float erff(float a1)
{
  float result;

  MEMORY[0x24BDAE1C0](a1);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

long double expm1(long double __x)
{
  long double result;

  MEMORY[0x24BDAE290](__x);
  return result;
}

float expm1f(float a1)
{
  float result;

  MEMORY[0x24BDAE298](a1);
  return result;
}

long double fma(long double __x, long double __y, long double __z)
{
  long double result;

  MEMORY[0x24BDAE3E0](__x, __y, __z);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

long double log1p(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAC0](__x);
  return result;
}

float log1pf(float a1)
{
  float result;

  MEMORY[0x24BDAEAC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAFB28](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE28](__x);
  return result;
}

float sinhf(float a1)
{
  float result;

  MEMORY[0x24BDAFE30](a1);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x24BEE4CF8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x24BEE4D68]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

long double tanh(long double __x)
{
  long double result;

  MEMORY[0x24BDB0148](__x);
  return result;
}

float tanhf(float a1)
{
  float result;

  MEMORY[0x24BDB0150](a1);
  return result;
}
