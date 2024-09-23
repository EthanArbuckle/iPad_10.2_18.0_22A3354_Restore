uint64_t BidirectionalCollection<>.wholeMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return BidirectionalCollection<>.wholeMatch<A, B>(of:)(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE75C8]);
}

uint64_t BidirectionalCollection<>.prefixMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return BidirectionalCollection<>.wholeMatch<A, B>(of:)(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE75D0]);
}

uint64_t BidirectionalCollection<>.wholeMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  void (*v14)(void);
  uint64_t v15;
  char *v16;
  uint64_t v18;

  v13 = *(_QWORD *)(a5 - 8);
  v14 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14();
  a8(v16, a3, a5, a6, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, a5);
}

uint64_t BidirectionalCollection<>.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return BidirectionalCollection<>.contains<A>(_:)(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE7600]);
}

uint64_t BidirectionalCollection<>.firstRange<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  v9 = BidirectionalCollection<>.firstRange<A>(of:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v9;
}

uint64_t BidirectionalCollection<>.ranges<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  v9 = BidirectionalCollection<>.ranges<A>(of:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v9;
}

uint64_t BidirectionalCollection<>.split<A>(maxSplits:omittingEmptySubsequences:separator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a6 - 8);
  v8 = MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11(v8);
  v12 = BidirectionalCollection<>.split<A>(separator:maxSplits:omittingEmptySubsequences:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a6);
  return v12;
}

uint64_t BidirectionalCollection<>.starts<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return BidirectionalCollection<>.contains<A>(_:)(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE75F0]);
}

uint64_t BidirectionalCollection<>.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  char *v15;
  uint64_t v17;

  v12 = *(_QWORD *)(a4 - 8);
  v13 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13();
  LOBYTE(a7) = a7(v15, a3, a4, a5, a6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, a4);
  return a7 & 1;
}

uint64_t BidirectionalCollection<>.trimmingPrefix<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  v9 = BidirectionalCollection<>.trimmingPrefix<A>(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v9;
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = *(_QWORD *)(a5 - 8);
  v7 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  BidirectionalCollection<>.firstMatch<A, B>(of:)();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, a5);
}

uint64_t BidirectionalCollection<>.matches<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = *(_QWORD *)(a5 - 8);
  v7 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  v10 = BidirectionalCollection<>.matches<A, B>(of:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, a5);
  return v10;
}

uint64_t RangeReplaceableCollection<>.trimPrefix<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = *(_QWORD *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  RangeReplaceableCollection<>.trimPrefix<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a4);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(with:subrange:maxReplacements:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(uint64_t);
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = a8;
  v18 = a7;
  v17 = a11;
  v11 = *(_QWORD *)(a9 - 8);
  v12 = MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15(v12);
  RangeReplaceableCollection<>.replacing<A, B>(_:with:subrange:maxReplacements:)();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(with:maxReplacements:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  _QWORD v14[3];

  v14[2] = a6;
  v14[1] = a5;
  v8 = *(_QWORD *)(a7 - 8);
  v9 = MEMORY[0x24BDAC7A8]();
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a7);
}

uint64_t RangeReplaceableCollection<>.replace<A, B>(with:maxReplacements:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  uint64_t v14;

  v14 = a6;
  v8 = *(_QWORD *)(a7 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a7);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(subrange:maxReplacements:content:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t);
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a8;
  v22 = a6;
  v23 = a7;
  v20 = a9;
  v21 = a3;
  v19 = a13;
  v13 = *(_QWORD *)(a11 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17(v14);
  RangeReplaceableCollection<>.replacing<A, B, C>(_:subrange:maxReplacements:with:)();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, a11);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(maxReplacements:content:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(uint64_t);
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a8;
  v18 = a6;
  v19 = a7;
  v17 = a11;
  v11 = *(_QWORD *)(a9 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15(v12);
  RangeReplaceableCollection<>.replacing<A, B, C>(_:maxReplacements:with:)();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

uint64_t RangeReplaceableCollection<>.replace<A, B, C>(maxReplacements:content:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(uint64_t);
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = a8;
  v18 = a7;
  v17 = a11;
  v11 = *(_QWORD *)(a9 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15(v12);
  RangeReplaceableCollection<>.replace<A, B, C>(_:maxReplacements:with:)();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Anchor.Kind(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Anchor.Kind()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Anchor.Kind()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Anchor.Kind()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void Anchor.regex.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for DSLTree.Atom.Assertion();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for _RegexFactory();
  MEMORY[0x24BDAC7A8](v2);
  v3 = *v0;
  _RegexFactory.init()();
  __asm { BR              X9 }
}

uint64_t sub_22AE30700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v1, *MEMORY[0x24BEE7570], v0);
  _RegexFactory.assertion<A>(_:)();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v3, v2);
}

void static Anchor.startOfSubject.getter(_WORD *a1@<X8>)
{
  *a1 = 0;
}

void static Anchor.endOfSubjectBeforeNewline.getter(_WORD *a1@<X8>)
{
  *a1 = 1;
}

void static Anchor.endOfSubject.getter(_WORD *a1@<X8>)
{
  *a1 = 2;
}

void static Anchor.firstMatchingPositionInSubject.getter(_WORD *a1@<X8>)
{
  *a1 = 3;
}

void static Anchor.textSegmentBoundary.getter(_WORD *a1@<X8>)
{
  *a1 = 4;
}

void static Anchor.startOfLine.getter(_WORD *a1@<X8>)
{
  *a1 = 5;
}

void static Anchor.endOfLine.getter(_WORD *a1@<X8>)
{
  *a1 = 6;
}

void static Anchor.wordBoundary.getter(_WORD *a1@<X8>)
{
  *a1 = 7;
}

void Anchor.inverted.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;
  char v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = (v2 & 1) == 0;
}

uint64_t (*Lookahead.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t Lookahead.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x24BEE72E8], a5);
}

uint64_t Lookahead.init<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x24BEE72E8], a5);
}

uint64_t (*NegativeLookahead.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t NegativeLookahead.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x24BEE72F8], a5);
}

uint64_t Lookahead.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;

  v19 = a5;
  v20 = a6;
  v10 = type metadata accessor for _RegexFactory();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Regex();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v19 - v16;
  _RegexFactory.init()();
  v19(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v20, v17, v14);
}

uint64_t NegativeLookahead.init<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x24BEE72F8], a5);
}

uint64_t Lookahead.init<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void (*a5)(char *, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;

  v24 = a4;
  v25 = a5;
  v26 = a6;
  v8 = *(_QWORD *)(a3 - 8);
  v22 = a1;
  v23 = v8;
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for _RegexFactory();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Regex();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v21 - v17;
  v19 = _RegexFactory.init()();
  v22(v19);
  v25(v10, a2, a3, v24);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, a3);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v26, v18, v15);
}

uint64_t static RegexComponentBuilder.buildBlock()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for _RegexFactory();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.empty<A>()();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t static RegexComponentBuilder.buildPartialBlock<A>(first:)()
{
  return dispatch thunk of RegexComponent.regex.getter();
}

uint64_t CharacterClass.regex.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v1 = type metadata accessor for _RegexFactory();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CharacterClass();
  outlined init with copy of DSLTree.Atom.CharacterClass?(v0 + *(int *)(v12 + 20), (uint64_t)v7, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v7, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    _RegexFactory.init()();
    _RegexFactory.customCharacterClass<A>(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    _RegexFactory.init()();
    _RegexFactory.characterClass<A>(_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2E8814]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for CharacterClass()
{
  uint64_t result;

  result = type metadata singleton initialization cache for CharacterClass;
  if (!type metadata singleton initialization cache for CharacterClass)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CharacterClass.inverted.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v24)(uint64_t, char *, uint64_t);
  char *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(uint64_t, char *, uint64_t);
  char *v40;
  uint64_t v41;

  v2 = v1;
  v41 = a1;
  v3 = type metadata accessor for DSLTree.CustomCharacterClass();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = (void (*)(uint64_t, char *, uint64_t))v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CharacterClass();
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v36 - v12;
  v14 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v37 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v36 - v18;
  outlined init with copy of DSLTree.Atom.CharacterClass?(v2 + *(int *)(v6 + 20), (uint64_t)v11, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v20(v11, 1, v14) == 1)
  {
    outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v11, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  }
  else
  {
    DSLTree.Atom.CharacterClass.inverted.getter();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
    if (v20(v13, 1, v14) != 1)
    {
      v24 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 32);
      v39 = v24;
      v24((uint64_t)v19, v13, v14);
      v25 = v37;
      v24((uint64_t)v37, v19, v14);
      v21 = (uint64_t)v40;
      v26 = (uint64_t)&v40[*(int *)(v6 + 20)];
      v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      v27(v26, 1, 1, v14);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
      v28 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
      v29 = *(_QWORD *)(v28 - 8);
      v30 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
      v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_22AE36050;
      v32 = v31 + v30;
      (*(void (**)(unint64_t, char *, uint64_t))(v15 + 16))(v32, v25, v14);
      v33 = *MEMORY[0x24BEE7528];
      v34 = type metadata accessor for DSLTree.Atom();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v32, v33, v34);
      (*(void (**)(unint64_t, _QWORD, uint64_t))(v29 + 104))(v32, *MEMORY[0x24BEE7488], v28);
      DSLTree.CustomCharacterClass.init(members:isInverted:)();
      outlined destroy of DSLTree.Atom.CharacterClass?(v26, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
      v39(v26, v25, v14);
      v27(v26, 0, 1, v14);
      return outlined init with take of CharacterClass(v21, v41);
    }
  }
  outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v13, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  DSLTree.CustomCharacterClass.inverted.getter();
  v21 = (uint64_t)v40;
  v22 = (uint64_t)&v40[*(int *)(v6 + 20)];
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v23(v22, 1, 1, v14);
  (*(void (**)(uint64_t, char *, _QWORD))(v38 + 32))(v21, v5, v39);
  outlined destroy of DSLTree.Atom.CharacterClass?(v22, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  v23(v22, 1, 1, v14);
  return outlined init with take of CharacterClass(v21, v41);
}

uint64_t outlined init with take of CharacterClass(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static RegexComponent<>.any.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.any.getter(MEMORY[0x24BEE7530], a1);
}

uint64_t static RegexComponent<>.anyNonNewline.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.any.getter(MEMORY[0x24BEE74D0], a1);
}

uint64_t static RegexComponent<>.any.getter@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v19;

  v4 = type metadata accessor for DSLTree.CustomCharacterClass();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v8 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22AE36050;
  v12 = v11 + v10;
  v13 = *a1;
  v14 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BEE7488], v8);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  v15 = a2 + *(int *)(type metadata accessor for CharacterClass() + 20);
  v16 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v15, 1, 1, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  outlined destroy of DSLTree.Atom.CharacterClass?(v15, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v17)(v15, 1, 1, v16);
}

uint64_t static RegexComponent<>.anyGraphemeCluster.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x24BEE74E0], a1);
}

uint64_t static RegexComponent<>.digit.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x24BEE7508], a1);
}

uint64_t static RegexComponent<>.anyGraphemeCluster.getter@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[1] = a2;
  v4 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *a1, v4);
  v8 = a2 + *(int *)(type metadata accessor for CharacterClass() + 20);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v9(v8, 1, 1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v10 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_22AE36050;
  v14 = v13 + v12;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 16))(v14, v7, v4);
  v15 = *MEMORY[0x24BEE7528];
  v16 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x24BEE7488], v10);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  outlined destroy of DSLTree.Atom.CharacterClass?(v8, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v8, v7, v4);
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v9)(v8, 0, 1, v4);
}

uint64_t static RegexComponent<>.hexDigit.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void (*v15)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v27[2];
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a1;
  v1 = type metadata accessor for DSLTree.CustomCharacterClass();
  v30 = *(_QWORD *)(v1 - 8);
  v31 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v28 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v3 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v27[0] = 2 * v5;
  v7 = swift_allocObject();
  v27[1] = v7;
  *(_OWORD *)(v7 + 16) = xmmword_22AE36060;
  v8 = (_QWORD *)(v7 + v6);
  *v8 = 65;
  v8[1] = 0xE100000000000000;
  v9 = *MEMORY[0x24BEE7538];
  v10 = type metadata accessor for DSLTree.Atom();
  v11 = *(void (**)(void))(*(_QWORD *)(v10 - 8) + 104);
  ((void (*)(_QWORD *, uint64_t, uint64_t))v11)(v8, v9, v10);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.Atom, DSLTree.Atom));
  v13 = (_QWORD *)((char *)v8 + *(int *)(v12 + 48));
  *v13 = 70;
  v13[1] = 0xE100000000000000;
  v11();
  v14 = *MEMORY[0x24BEE7490];
  v15 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v4 + 104);
  v15(v8, v14, v3);
  v16 = (_QWORD *)((char *)v8 + v5);
  *v16 = 97;
  v16[1] = 0xE100000000000000;
  ((void (*)(_QWORD *, uint64_t, uint64_t))v11)(v16, v9, v10);
  v17 = (_QWORD *)((char *)v16 + *(int *)(v12 + 48));
  *v17 = 102;
  v17[1] = 0xE100000000000000;
  v11();
  v15(v16, v14, v3);
  v18 = (_QWORD *)((char *)v8 + v27[0]);
  *v18 = 48;
  v18[1] = 0xE100000000000000;
  ((void (*)(_QWORD *, uint64_t, uint64_t))v11)(v18, v9, v10);
  v19 = (_QWORD *)((char *)v18 + *(int *)(v12 + 48));
  *v19 = 57;
  v19[1] = 0xE100000000000000;
  v11();
  v15(v18, v14, v3);
  v20 = v28;
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  v21 = type metadata accessor for CharacterClass();
  v22 = v29;
  v23 = v29 + *(int *)(v21 + 20);
  v24 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25(v23, 1, 1, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v22, v20, v31);
  outlined destroy of DSLTree.Atom.CharacterClass?(v23, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v25)(v23, 1, 1, v24);
}

uint64_t static RegexComponent<>.word.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x24BEE7500], a1);
}

uint64_t static RegexComponent<>.whitespace.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x24BEE74D8], a1);
}

uint64_t static RegexComponent<>.horizontalWhitespace.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x24BEE74F8], a1);
}

uint64_t static RegexComponent<>.newlineSequence.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x24BEE74E8], a1);
}

uint64_t static RegexComponent<>.verticalWhitespace.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x24BEE74F0], a1);
}

uint64_t static RegexComponent<>.anyOf<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static RegexComponent<>.anyOf<A>(_:)(a1, a2, (void (*)(char *, char *))closure #1 in static RegexComponent<>.anyOf<A>(_:), a3);
}

{
  return static RegexComponent<>.anyOf<A>(_:)(a1, a2, (void (*)(char *, char *))closure #1 in static RegexComponent<>.anyOf<A>(_:), a3);
}

uint64_t closure #1 in static RegexComponent<>.anyOf<A>(_:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a1[1];
  *a2 = *a1;
  a2[1] = v3;
  v4 = *MEMORY[0x24BEE7538];
  v5 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a2, v4, v5);
  v6 = *MEMORY[0x24BEE7488];
  v7 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(a2, v6, v7);
  return swift_bridgeObjectRetain();
}

uint64_t _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  Swift::Int v32;
  uint64_t result;
  uint64_t v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  char *v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v51 = (char *)v37 - v13;
  v15 = v14;
  v47 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = type metadata accessor for Optional();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v44 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v50 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = a6;
  v30 = swift_getAssociatedTypeWitness();
  v45 = *(_QWORD *)(v30 - 8);
  v46 = v30;
  MEMORY[0x24BDAC7A8](v30);
  v56 = (char *)v37 - v31;
  v32 = dispatch thunk of Sequence.underestimatedCount.getter();
  v57 = MEMORY[0x22E2E8724](v53);
  v53 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v32);
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v29, v48, v47);
  result = dispatch thunk of Sequence.makeIterator()();
  if (v32 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  v34 = v46;
  swift_getAssociatedConformanceWitness();
  if (v32)
  {
    do
    {
      dispatch thunk of IteratorProtocol.next()();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_14;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v45 + 8))(v56, v34);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
    }
    while (--v32);
  }
  v35 = v44;
  dispatch thunk of IteratorProtocol.next()();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
  {
LABEL_10:
    (*(void (**)(char *, uint64_t))(v45 + 8))(v56, v34);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(_QWORD *)(v17 + 32);
    v36 = v38;
    while (1)
    {
      ((void (*)(char *, char *, uint64_t))v50)(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of IteratorProtocol.next()();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v56, v34);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t static RegexComponent<>.anyOf<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void (*a3)(char *, char *)@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  v8 = type metadata accessor for DSLTree.CustomCharacterClass();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(a3, 0, a1, v12, MEMORY[0x24BEE4078], a2, MEMORY[0x24BEE40A8], v13);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  v14 = a4 + *(int *)(type metadata accessor for CharacterClass() + 20);
  v15 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
  outlined destroy of DSLTree.Atom.CharacterClass?(v14, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(v14, 1, 1, v15);
}

uint64_t closure #1 in static RegexComponent<>.anyOf<A>(_:)@<X0>(_DWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a2 = *a1;
  v3 = *MEMORY[0x24BEE7540];
  v4 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a2, v3, v4);
  v5 = *MEMORY[0x24BEE7488];
  v6 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(a2, v5, v6);
}

uint64_t static CharacterClass.generalCategory(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v2 = type metadata accessor for DSLTree.CustomCharacterClass();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DSLTree.CustomCharacterClass.generalCategory(_:)();
  v6 = a1 + *(int *)(type metadata accessor for CharacterClass() + 20);
  v7 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
  outlined destroy of DSLTree.Atom.CharacterClass?(v6, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(v6, 1, 1, v7);
}

uint64_t ... infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, uint64_t, uint64_t);
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = a2;
  v29 = a5;
  v9 = type metadata accessor for DSLTree.CustomCharacterClass();
  v30 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (uint64_t *)((char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = (_QWORD *)((char *)v15
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.Atom, DSLTree.Atom))
                          + 48));
  *v15 = a1;
  v15[1] = a2;
  v17 = *MEMORY[0x24BEE7538];
  v18 = type metadata accessor for DSLTree.Atom();
  v19 = *(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104);
  v19(v15, v17, v18);
  *v16 = a3;
  v16[1] = a4;
  v19(v16, v17, v18);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BEE7490], v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v20 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_22AE36050;
  (*(void (**)(unint64_t, _QWORD *, uint64_t))(v13 + 32))(v21 + v20, v15, v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  v22 = type metadata accessor for CharacterClass();
  v23 = v29;
  v24 = v29 + *(int *)(v22 + 20);
  v25 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v26(v24, 1, 1, v25);
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v23, v11, v31);
  outlined destroy of DSLTree.Atom.CharacterClass?(v24, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26)(v24, 1, 1, v25);
}

uint64_t ... infix(_:_:)@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_DWORD *, uint64_t, uint64_t);
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;

  v24 = a3;
  v25 = type metadata accessor for DSLTree.CustomCharacterClass();
  v5 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (_DWORD *)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (_DWORD *)((char *)v11
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.Atom, DSLTree.Atom))
                          + 48));
  *v11 = a1;
  v13 = *MEMORY[0x24BEE7540];
  v14 = type metadata accessor for DSLTree.Atom();
  v15 = *(void (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104);
  v15(v11, v13, v14);
  *v12 = a2;
  v15(v12, v13, v14);
  (*(void (**)(_DWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE7490], v8);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_22AE36050;
  (*(void (**)(unint64_t, _DWORD *, uint64_t))(v9 + 32))(v17 + v16, v11, v8);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  v18 = type metadata accessor for CharacterClass();
  v19 = v24;
  v20 = v24 + *(int *)(v18 + 20);
  v21 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v22(v20, 1, 1, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v19, v7, v25);
  outlined destroy of DSLTree.Atom.CharacterClass?(v20, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v22)(v20, 1, 1, v21);
}

size_t RegexComponent<>.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  int64_t v24;
  size_t v25;
  size_t v26;
  int64_t v27;
  size_t result;
  unint64_t v29;
  size_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  size_t v52;

  v47 = a3;
  v48 = a1;
  v4 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<CharacterClass>);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v45 - v12;
  v14 = type metadata accessor for CharacterClass();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DSLTree.CustomCharacterClass();
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = a2;
  v23 = *(_QWORD *)(a2 + 16);
  if (!v23)
  {
    v33 = v20;
    v34 = v21;
    swift_bridgeObjectRelease();
    v35 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v22, v48, v33);
    outlined destroy of CharacterClass(v35);
    v36 = (uint64_t)&v17[*(int *)(v14 + 20)];
    v37 = type metadata accessor for DSLTree.Atom.CharacterClass();
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56);
    v38(v36, 1, 1, v37);
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v17, v22, v33);
    outlined destroy of DSLTree.Atom.CharacterClass?(v36, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    v38(v36, 1, 1, v37);
    v39 = v47;
    return outlined init with take of CharacterClass((uint64_t)v17, v39);
  }
  v45 = v14;
  v46 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = v21;
  v51 = v20;
  outlined init with take of CharacterClass(v48, (uint64_t)v13);
  v24 = v23 + 1;
  v25 = MEMORY[0x24BEE4AF8];
  v52 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24, 0, MEMORY[0x24BEE4AF8]);
  outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v13, (uint64_t)v11, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>);
  specialized Array.append<A>(contentsOf:)((uint64_t)v11);
  specialized Array.append<A>(contentsOf:)(v49);
  v26 = v52;
  v27 = *(_QWORD *)(v52 + 16);
  if (!v27)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    v40 = v46;
    v39 = v47;
    v41 = v45;
    DSLTree.CustomCharacterClass.init(members:isInverted:)();
    v42 = (uint64_t)&v17[*(int *)(v41 + 20)];
    v43 = type metadata accessor for DSLTree.Atom.CharacterClass();
    v44 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
    v44(v42, 1, 1, v43);
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v17, v40, v51);
    outlined destroy of DSLTree.Atom.CharacterClass?(v42, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    v44(v42, 1, 1, v43);
    return outlined init with take of CharacterClass((uint64_t)v17, v39);
  }
  v52 = v25;
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v27, 0);
  v29 = 0;
  LODWORD(v48) = *MEMORY[0x24BEE7498];
  v49 = v27;
  while (v29 < *(_QWORD *)(v26 + 16))
  {
    outlined init with copy of CharacterClass(v26+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v29, (uint64_t)v17);
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v7, v17, v51);
    outlined destroy of CharacterClass((uint64_t)v17);
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, v48, v4);
    v30 = v52;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v30 + 16) + 1, 1);
      v30 = v52;
    }
    v32 = *(_QWORD *)(v30 + 16);
    v31 = *(_QWORD *)(v30 + 24);
    if (v32 >= v31 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1);
      v30 = v52;
    }
    ++v29;
    *(_QWORD *)(v30 + 16) = v32 + 1;
    result = (*(uint64_t (**)(size_t, char *, uint64_t))(v5 + 32))(v30+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v32, v7, v4);
    v52 = v30;
    if (v49 == v29)
      goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t CharacterClass.union(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(unint64_t, uint64_t, uint64_t);
  uint64_t v15;
  void (*v16)(unint64_t, uint64_t, uint64_t);
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v24 = a1;
  v25 = a2;
  v4 = type metadata accessor for DSLTree.CustomCharacterClass();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v8 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22AE36070;
  v13 = v12 + v11;
  v14 = *(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16);
  v14(v13, v3, v4);
  v15 = *MEMORY[0x24BEE7498];
  v16 = *(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 104);
  v16(v13, v15, v8);
  v17 = v13 + v10;
  v14(v17, v24, v4);
  v16(v17, v15, v8);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  v18 = type metadata accessor for CharacterClass();
  v19 = v25;
  v20 = v25 + *(int *)(v18 + 20);
  v21 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v22(v20, 1, 1, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v19, v7, v4);
  outlined destroy of DSLTree.Atom.CharacterClass?(v20, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v22)(v20, 1, 1, v21);
}

uint64_t CharacterClass.intersection(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return CharacterClass.intersection(_:)(a1, MEMORY[0x24BEE7478], a2);
}

uint64_t CharacterClass.subtracting(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return CharacterClass.intersection(_:)(a1, MEMORY[0x24BEE7470], a2);
}

uint64_t CharacterClass.intersection(_:)@<X0>(uint64_t a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;

  v24 = a1;
  v25 = a2;
  v26 = a3;
  v3 = type metadata accessor for DSLTree.CustomCharacterClass();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v7 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_22AE36050;
  v11 = (uint64_t *)(v10 + v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.CustomCharacterClass, DSLTree.CustomCharacterClass));
  v13 = swift_allocBox();
  v15 = v14 + *(int *)(v12 + 48);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v16(v14, v23, v3);
  v16(v15, v24, v3);
  *v11 = v13;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v8 + 104))(v11, *v25, v7);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  v17 = type metadata accessor for CharacterClass();
  v18 = v26;
  v19 = v26 + *(int *)(v17 + 20);
  v20 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v21(v19, 1, 1, v20);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v6, v3);
  outlined destroy of DSLTree.Atom.CharacterClass?(v19, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v21)(v19, 1, 1, v20);
}

uint64_t CharacterClass.symmetricDifference(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return CharacterClass.intersection(_:)(a1, MEMORY[0x24BEE7480], a2);
}

uint64_t Regex.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = *(_QWORD *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  dispatch thunk of RegexComponent.regex.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a4);
}

void String.regex.getter()
{
  swift_bridgeObjectRetain();
  JUMPOUT(0x22E2E8598);
}

void protocol witness for RegexComponent.regex.getter in conformance String()
{
  swift_bridgeObjectRetain();
  JUMPOUT(0x22E2E8598);
}

void Substring.regex.getter()
{
  MEMORY[0x22E2E8664]();
  JUMPOUT(0x22E2E8598);
}

void protocol witness for RegexComponent.regex.getter in conformance Substring()
{
  _QWORD *v0;

  MEMORY[0x22E2E8664](*v0, v0[1], v0[2], v0[3]);
  JUMPOUT(0x22E2E8598);
}

uint64_t Character.regex.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for _RegexFactory();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.char<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t protocol witness for RegexComponent.regex.getter in conformance Character()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for _RegexFactory();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.char<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t Unicode.Scalar.regex.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for _RegexFactory();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.scalar<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t protocol witness for RegexComponent.regex.getter in conformance Unicode.Scalar()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for _RegexFactory();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.scalar<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t (*One.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t One.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for Regex();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - v8;
  dispatch thunk of RegexComponent.regex.getter();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t (*OneOrMore.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*ZeroOrMore.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*Optionally.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*Repeat.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t static AlternationBuilder.buildPartialBlock<A>(first:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  swift_getAssociatedTypeWitness();
  v2 = type metadata accessor for Regex();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - v4;
  dispatch thunk of RegexComponent.regex.getter();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t static AlternationBuilder.buildExpression<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t (*ChoiceOf.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t ChoiceOf.init(_:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t (*Capture.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*TryCapture.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t Lookahead.regex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Regex();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Lookahead.regex.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Regex();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*Local.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t Lookahead.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t Reference.regex.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for _RegexFactory();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.symbolicReference<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

size_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  v10 = *(_QWORD *)(type metadata accessor for DSLTree.CustomCharacterClass.Member() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for DSLTree.CustomCharacterClass.Member() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

size_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<CharacterClass>);
  v10 = *(_QWORD *)(type metadata accessor for CharacterClass() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for CharacterClass() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  size_t isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int64_t v12;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v12 = v4 + v2;
  else
    v12 = v4;
  v3 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v12, 1, v3);
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    result = swift_bridgeObjectRelease();
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v8 = (v3[3] >> 1) - v3[2];
  result = type metadata accessor for CharacterClass();
  if (v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  result = swift_bridgeObjectRelease();
  if (!v2)
  {
LABEL_14:
    *(_QWORD *)v1 = v3;
    return result;
  }
  v9 = v3[2];
  v10 = __OFADD__(v9, v2);
  v11 = v9 + v2;
  if (!v10)
  {
    v3[2] = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  size_t *v1;
  size_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  unint64_t v18;
  size_t isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  unint64_t v38;
  int v39;
  size_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  void (*v45)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;

  v2 = v1;
  v50 = type metadata accessor for CharacterClass();
  v4 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v49 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CharacterClass?);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v48 = (uint64_t)v44 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v44 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (_QWORD *)*v2;
  v18 = *(_QWORD *)(*v2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v2 = (size_t)v17;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v20 = v17[3] >> 1, v20 <= v18))
  {
    v17 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v18 + 1, 1, v17);
    *v2 = (size_t)v17;
    v20 = v17[3] >> 1;
  }
  v21 = v17[2];
  v22 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v23 = *(_QWORD *)(v4 + 72);
  v24 = v20 - v21;
  v25 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v16, (uint64_t)v17 + v22 + v23 * v21, v20 - v21);
  if (v25 < 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  v26 = v17[2];
  a1 = v26 + v25;
  if (__OFADD__(v26, v25))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v17[2] = a1;
  if (v25 != v24)
  {
    v27 = &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator;
    v28 = (uint64_t)v16;
    return outlined destroy of DSLTree.Atom.CharacterClass?(v28, v27);
  }
LABEL_11:
  outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v16, (uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
  v30 = v50;
  v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v45(v16, 1, 1, v50);
  v31 = v48;
  outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, v48, &demangling cache variable for type metadata for CharacterClass?);
  v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  v33 = v31;
  v47 = v32;
  v34 = v32((char *)v31, 1, v30);
  v35 = (uint64_t)v49;
  if (v34 != 1)
  {
    do
    {
      outlined destroy of DSLTree.Atom.CharacterClass?(v33, &demangling cache variable for type metadata for CharacterClass?);
      v37 = *v2;
      v38 = *(_QWORD *)(*v2 + 24);
      if ((uint64_t)(v38 >> 1) < a1 + 1)
      {
        v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, a1 + 1, 1, (_QWORD *)*v2);
        *v2 = v37;
        v46 = *(_QWORD *)(v37 + 24) >> 1;
      }
      else
      {
        v46 = v38 >> 1;
      }
      swift_retain();
      outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, (uint64_t)v9, &demangling cache variable for type metadata for CharacterClass?);
      v39 = v47(v9, 1, v50);
      v44[1] = v37;
      if (v39 == 1)
      {
LABEL_14:
        swift_bridgeObjectRelease();
        outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v9, &demangling cache variable for type metadata for CharacterClass?);
        v36 = a1;
      }
      else
      {
        v40 = v37 + v22;
        if (a1 <= v46)
          v36 = v46;
        else
          v36 = a1;
        v41 = v40 + v23 * a1;
        v46 = v36;
        while (1)
        {
          outlined init with take of CharacterClass((uint64_t)v9, v35);
          if (v36 == a1)
            break;
          outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
          outlined init with take of CharacterClass(v35, v41);
          ++a1;
          outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v16, (uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
          v42 = v50;
          v45(v16, 1, 1, v50);
          v36 = v46;
          outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, (uint64_t)v9, &demangling cache variable for type metadata for CharacterClass?);
          v43 = v42;
          v35 = (uint64_t)v49;
          v41 += v23;
          if (v47(v9, 1, v43) == 1)
            goto LABEL_14;
        }
        outlined destroy of CharacterClass(v35);
        swift_bridgeObjectRelease();
        a1 = v36;
      }
      *(_QWORD *)(*v2 + 16) = v36;
      v33 = v48;
      outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, v48, &demangling cache variable for type metadata for CharacterClass?);
    }
    while (v47((char *)v33, 1, v50) != 1);
  }
  outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
  outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v16, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  v28 = v33;
  v27 = &demangling cache variable for type metadata for CharacterClass?;
  return outlined destroy of DSLTree.Atom.CharacterClass?(v28, v27);
}

uint64_t outlined init with copy of CharacterClass(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CharacterClass(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CharacterClass();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t instantiation function for generic protocol witness table for Lookahead<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for Lookahead<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for NegativeLookahead<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for NegativeLookahead<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for OneOrMore<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for OneOrMore<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for ZeroOrMore<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for ZeroOrMore<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Optionally<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for Optionally<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Repeat<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for Repeat<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for ChoiceOf<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for ChoiceOf<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Capture<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for Capture<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for TryCapture<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for TryCapture<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Local<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2E8820](&protocol conformance descriptor for Local<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Anchor(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *((unsigned __int8 *)a1 + 1);
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Anchor(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22AE34030 + 4 * byte_22AE3583D[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_22AE34064 + 4 * byte_22AE35838[v4]))();
}

uint64_t sub_22AE34064(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_22AE3406C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x22AE34074);
  return result;
}

uint64_t sub_22AE34080(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x22AE34088);
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_22AE3408C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_22AE34094(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Anchor()
{
  return &type metadata for Anchor;
}

uint64_t type metadata instantiation function for Lookahead()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for Lookahead()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Lookahead()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for Lookahead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Lookahead);
}

uint64_t getEnumTagSinglePayload for NegativeLookahead()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for NegativeLookahead()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for NegativeLookahead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NegativeLookahead);
}

ValueMetadata *type metadata accessor for RegexComponentBuilder()
{
  return &type metadata for RegexComponentBuilder;
}

uint64_t *initializeBufferWithCopyOfBuffer for CharacterClass(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for DSLTree.CustomCharacterClass();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for DSLTree.Atom.CharacterClass();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for CharacterClass(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t initializeWithCopy for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacterClass()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22AE346E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CharacterClass()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22AE3476C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for DSLTree.CustomCharacterClass();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void type metadata completion function for CharacterClass()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for DSLTree.CustomCharacterClass();
  if (v0 <= 0x3F)
  {
    type metadata accessor for DSLTree.Atom.CharacterClass?();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for DSLTree.Atom.CharacterClass?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for DSLTree.Atom.CharacterClass?)
  {
    type metadata accessor for DSLTree.Atom.CharacterClass();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  }
}

uint64_t getEnumTagSinglePayload for One()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for One()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for One(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for One);
}

uint64_t getEnumTagSinglePayload for OneOrMore()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for OneOrMore()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for OneOrMore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OneOrMore);
}

uint64_t getEnumTagSinglePayload for ZeroOrMore()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ZeroOrMore()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for ZeroOrMore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ZeroOrMore);
}

uint64_t getEnumTagSinglePayload for Optionally()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Optionally()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for Optionally(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Optionally);
}

uint64_t getEnumTagSinglePayload for Repeat()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Repeat()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for Repeat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Repeat);
}

ValueMetadata *type metadata accessor for AlternationBuilder()
{
  return &type metadata for AlternationBuilder;
}

uint64_t getEnumTagSinglePayload for ChoiceOf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ChoiceOf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for ChoiceOf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ChoiceOf);
}

uint64_t getEnumTagSinglePayload for Capture()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Capture()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for Capture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Capture);
}

uint64_t getEnumTagSinglePayload for TryCapture()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for TryCapture()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for TryCapture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TryCapture);
}

uint64_t type metadata completion function for Lookahead()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Regex();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for Lookahead(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Regex();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Local()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for Local()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Regex();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for Local(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Local);
}

uint64_t type metadata completion function for Reference()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ReferenceID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReferenceID();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for Reference(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ReferenceID();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Reference()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22AE34EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReferenceID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for Reference()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22AE34F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReferenceID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for Reference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Reference);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Anchor.Kind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Anchor.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_22AE35058 + 4 * byte_22AE35847[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_22AE3508C + 4 * byte_22AE35842[v4]))();
}

uint64_t sub_22AE3508C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE35094(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE3509CLL);
  return result;
}

uint64_t sub_22AE350A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE350B0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_22AE350B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE350BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for Anchor.Kind(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for Anchor.Kind(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Anchor.Kind()
{
  return &type metadata for Anchor.Kind;
}

unint64_t lazy protocol witness table accessor for type Anchor.Kind and conformance Anchor.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Anchor.Kind and conformance Anchor.Kind;
  if (!lazy protocol witness table cache variable for type Anchor.Kind and conformance Anchor.Kind)
  {
    result = MEMORY[0x22E2E8820](&protocol conformance descriptor for Anchor.Kind, &type metadata for Anchor.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Anchor.Kind and conformance Anchor.Kind);
  }
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a3;
  v26 = a1;
  v5 = type metadata accessor for CharacterClass();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CharacterClass?);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v25 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v25 - v19;
  outlined init with take of CharacterClass(v3, (uint64_t)v14);
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v21(v14, 0, 1, v5);
  v21(v18, 1, 1, v5);
  outlined assign with take of CharacterClass?((uint64_t)v14, (uint64_t)v18);
  result = outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v18, (uint64_t)v20, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  if (!a2)
  {
    v24 = 0;
    goto LABEL_10;
  }
  v23 = v25;
  if (!v25)
  {
LABEL_7:
    v24 = v23;
LABEL_10:
    outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v20, v26, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
    return v24;
  }
  if ((v25 & 0x8000000000000000) == 0)
  {
    v24 = 0;
    while (1)
    {
      outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v20, (uint64_t)v12, &demangling cache variable for type metadata for CharacterClass?);
      v21(v20, 1, 1, v5);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5) == 1)
        break;
      ++v24;
      outlined init with take of CharacterClass((uint64_t)v12, (uint64_t)v8);
      outlined init with take of CharacterClass((uint64_t)v8, a2);
      a2 += *(_QWORD *)(v6 + 72);
      if (v23 == v24)
        goto LABEL_7;
    }
    outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v12, &demangling cache variable for type metadata for CharacterClass?);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t outlined init with copy of DSLTree.Atom.CharacterClass?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of DSLTree.Atom.CharacterClass?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined assign with take of CharacterClass?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CharacterClass?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of CollectionOfOne<CharacterClass>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2E87FC](a1, v6, a5);
}

uint64_t ReferenceID._raw.getter()
{
  return MEMORY[0x24BEE7288]();
}

uint64_t ReferenceID.init()()
{
  return MEMORY[0x24BEE7290]();
}

uint64_t type metadata accessor for ReferenceID()
{
  return MEMORY[0x24BEE7298]();
}

uint64_t _RegexFactory.characterClass<A>(_:)()
{
  return MEMORY[0x24BEE72C0]();
}

uint64_t _RegexFactory.symbolicReference<A>(_:)()
{
  return MEMORY[0x24BEE72D0]();
}

uint64_t _RegexFactory.customCharacterClass<A>(_:)()
{
  return MEMORY[0x24BEE72D8]();
}

uint64_t _RegexFactory.char<A>(_:)()
{
  return MEMORY[0x24BEE7300]();
}

uint64_t _RegexFactory.empty<A>()()
{
  return MEMORY[0x24BEE7308]();
}

uint64_t _RegexFactory.scalar<A>(_:)()
{
  return MEMORY[0x24BEE7310]();
}

uint64_t _RegexFactory.assertion<A>(_:)()
{
  return MEMORY[0x24BEE7330]();
}

uint64_t _RegexFactory.init()()
{
  return MEMORY[0x24BEE7348]();
}

uint64_t type metadata accessor for _RegexFactory()
{
  return MEMORY[0x24BEE7350]();
}

uint64_t dispatch thunk of RegexComponent.regex.getter()
{
  return MEMORY[0x24BEE7398]();
}

uint64_t Regex.Match.subscript.getter()
{
  return MEMORY[0x24BEE7438]();
}

uint64_t Regex.init(verbatim:)()
{
  return MEMORY[0x24BEE7440]();
}

uint64_t type metadata accessor for Regex()
{
  return MEMORY[0x24BEE7450]();
}

uint64_t static DSLTree.CustomCharacterClass.generalCategory(_:)()
{
  return MEMORY[0x24BEE7468]();
}

uint64_t type metadata accessor for DSLTree.CustomCharacterClass.Member()
{
  return MEMORY[0x24BEE74A0]();
}

uint64_t DSLTree.CustomCharacterClass.init(members:isInverted:)()
{
  return MEMORY[0x24BEE74B0]();
}

uint64_t DSLTree.CustomCharacterClass.inverted.getter()
{
  return MEMORY[0x24BEE74B8]();
}

uint64_t type metadata accessor for DSLTree.CustomCharacterClass()
{
  return MEMORY[0x24BEE74C0]();
}

uint64_t DSLTree.Atom.CharacterClass.inverted.getter()
{
  return MEMORY[0x24BEE7510]();
}

uint64_t type metadata accessor for DSLTree.Atom.CharacterClass()
{
  return MEMORY[0x24BEE7518]();
}

uint64_t type metadata accessor for DSLTree.Atom.Assertion()
{
  return MEMORY[0x24BEE7598]();
}

uint64_t type metadata accessor for DSLTree.Atom()
{
  return MEMORY[0x24BEE75A0]();
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)()
{
  return MEMORY[0x24BEE75B8]();
}

uint64_t BidirectionalCollection<>.firstRange<A>(of:)()
{
  return MEMORY[0x24BEE75C0]();
}

uint64_t BidirectionalCollection<>.trimmingPrefix<A>(_:)()
{
  return MEMORY[0x24BEE75D8]();
}

uint64_t BidirectionalCollection<>.split<A>(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x24BEE75E0]();
}

uint64_t BidirectionalCollection<>.ranges<A>(of:)()
{
  return MEMORY[0x24BEE75E8]();
}

uint64_t BidirectionalCollection<>.matches<A, B>(of:)()
{
  return MEMORY[0x24BEE75F8]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t RangeReplaceableCollection<>.trimPrefix<A>(_:)()
{
  return MEMORY[0x24BEE7630]();
}

uint64_t RangeReplaceableCollection<>.replace<A, B, C>(_:maxReplacements:with:)()
{
  return MEMORY[0x24BEE7650]();
}

uint64_t RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)()
{
  return MEMORY[0x24BEE7658]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(_:maxReplacements:with:)()
{
  return MEMORY[0x24BEE7660]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)()
{
  return MEMORY[0x24BEE7668]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(_:with:subrange:maxReplacements:)()
{
  return MEMORY[0x24BEE7670]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(_:subrange:maxReplacements:with:)()
{
  return MEMORY[0x24BEE7678]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t StringProtocol<>._split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x24BEE7688]();
}

{
  return MEMORY[0x24BEE7690]();
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

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

