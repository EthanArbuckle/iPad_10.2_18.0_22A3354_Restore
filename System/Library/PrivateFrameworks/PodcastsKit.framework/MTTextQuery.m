@implementation MTTextQuery

- (void)runQueryWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  MTTextQuery *v58;
  void *v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _QWORD v80[6];

  v80[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73990], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v5;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v6;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v7;
  v66 = *MEMORY[0x24BE739A8];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLibraryQuery setEpisodeSortDescriptors:](self, "setEpisodeSortDescriptors:", v9);

  v10 = (void *)MEMORY[0x24BDBCE30];
  v64 = *MEMORY[0x24BE73B58];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self;
  -[MTLibraryQuery setPodcastSortDescriptors:](self, "setPodcastSortDescriptors:", v12);

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v4;
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v16;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v17)
  {
    v18 = v17;
    v62 = *(_QWORD *)v76;
    v61 = *MEMORY[0x24BE73AB8];
    v19 = *MEMORY[0x24BE738E8];
    v20 = *MEMORY[0x24BE73898];
    v21 = *MEMORY[0x24BE738B0];
    v22 = *MEMORY[0x24BE738A0];
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v76 != v62)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K contains[cl] %@"), v64, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v25);

        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K contains[cl] %@"), v61, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "addObject:", v26);

        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K contains[cl] %@"), v66, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addObject:", v27);

        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K contains[cl] %@"), v19, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addObject:", v28);

        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K contains[cl] %@"), v20, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v29);

        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K contains[cl] %@"), v21, v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v30);

        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > %@"), v22, &unk_24FD6BEA8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObject:", v31);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v74);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v73);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE73820], "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v32, v33, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "orPredicateWithSubpredicates:", v36);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v34, v67, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "andPredicateWithSubpredicates:", v38);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v72);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v71);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v39, v40, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "orPredicateWithSubpredicates:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x24BE737F8];
  v45 = v43;
  objc_msgSend(v44, "predicateForEpisodesInSearchResults");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v63, v45, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "andPredicateWithSubpredicates:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(v70, "arrayByAddingObjectsFromArray:", v68);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "andPredicateWithSubpredicates:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(v69, "arrayByAddingObjectsFromArray:", v68);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "andPredicateWithSubpredicates:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v51, v54, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "orPredicateWithSubpredicates:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTLibraryQuery runQueryWithPodcastPredicate:episodePredicate:channelPredicate:](v58, "runQueryWithPodcastPredicate:episodePredicate:channelPredicate:", v65, v48, v57);
}

- (id)titleForPodcastUuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainOrPrivateContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__MTTextQuery_titleForPodcastUuid___block_invoke;
    v10[3] = &unk_24FD62828;
    v6 = v5;
    v11 = v6;
    v12 = v3;
    v13 = &v14;
    objc_msgSend(v6, "performBlockAndWait:", v10);

    v7 = (void *)v15[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __35__MTTextQuery_titleForPodcastUuid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
