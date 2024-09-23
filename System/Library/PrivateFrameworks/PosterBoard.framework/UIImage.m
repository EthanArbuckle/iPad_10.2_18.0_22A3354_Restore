@implementation UIImage

void __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 32) / 5.0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pbf_galleryPosterWithColor_scale__path;
  pbf_galleryPosterWithColor_scale__path = v1;

}

uint64_t __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  return objc_msgSend((id)pbf_galleryPosterWithColor_scale__path, "fill");
}

void __97__UIImage_PBFUtilities__pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:", CFSTR("Gallery Hero image cache"));
  v1 = (void *)pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__heroCache;
  pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__heroCache = v0;

}

id __97__UIImage_PBFUtilities__pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "pbf_traitCollectionCompatibleWithContext:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v2, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
