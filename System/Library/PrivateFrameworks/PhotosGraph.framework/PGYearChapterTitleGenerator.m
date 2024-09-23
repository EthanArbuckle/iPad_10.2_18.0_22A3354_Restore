@implementation PGYearChapterTitleGenerator

- (PGYearChapterTitleGenerator)initWithTriggeredMemory:(id)a3
{
  id v4;
  PGYearChapterTitleGenerator *v5;
  void *v6;
  uint64_t v7;
  MABinaryAdjacency *momentNodesByChapterYearNode;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGYearChapterTitleGenerator;
  v5 = -[PGYearChapterTitleGenerator init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "memoryMomentNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGYearChapterTitleGenerator momentNodesByChapterYearNodeWithMomentNodes:](v5, "momentNodesByChapterYearNodeWithMomentNodes:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    momentNodesByChapterYearNode = v5->_momentNodesByChapterYearNode;
    v5->_momentNodesByChapterYearNode = (MABinaryAdjacency *)v7;

  }
  return v5;
}

- (id)momentNodesByChapterYearNodeWithMomentNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGGraphMomentNode dateOfMoment](PGGraphMomentNode, "dateOfMoment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphDateNode yearOfDate](PGGraphDateNode, "yearOfDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D429E0]);
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSteps:", v7);

  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v3, v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "transposed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)generateChapterTitles
{
  MABinaryAdjacency *momentNodesByChapterYearNode;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__30877;
  v11 = __Block_byref_object_dispose__30878;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  momentNodesByChapterYearNode = self->_momentNodesByChapterYearNode;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PGYearChapterTitleGenerator_generateChapterTitles__block_invoke;
  v6[3] = &unk_1E842CDC0;
  v6[4] = &v7;
  -[MABinaryAdjacency enumerateTargetsBySourceWithBlock:](momentNodesByChapterYearNode, "enumerateTargetsBySourceWithBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesByChapterYearNode, 0);
}

void __52__PGYearChapterTitleGenerator_generateChapterTitles__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  PGTimeTitleOptions *v8;
  void *v9;
  void *v10;
  PGChapterTitle *v11;
  void *v12;
  PGChapterTitle *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a2;
  v8 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTimeTitleOptions setAllowedFormats:](v8, "setAllowedFormats:", 4);
  objc_msgSend(v17, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v8, "setMomentNodes:", v9);

  -[PGTimeTitleOptions setFeaturedYearNodes:](v8, "setFeaturedYearNodes:", v7);
  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = [PGChapterTitle alloc];
    objc_msgSend(v17, "localDateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PGChapterTitle initWithLocalizedTitleString:chapterDateInterval:](v11, "initWithLocalizedTitleString:chapterDateInterval:", v10, v12);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v13);
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }

}

@end
