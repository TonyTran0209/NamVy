<?php $id = rand();  ?>
<?php if ($thumb || $images) { ?>
<div class="<?php echo $class; ?> image-container horizontal no-space-row">
    <div class="row">
        <div class="col-sm-10">
            <?php if ($thumb) { ?>
            <div class="thumbnail image">
                <?php if( isset($date_available) && $date_available == date('Y-m-d')) {   ?>
                <span class="product-label product-label-new">
                    <span><?php echo 'New'; ?></span>  
                </span>                                             
                <?php } ?>  
                <?php if( $special )  { ?>          
                    <span class="product-label sale-exist"><span class="product-label-special"><?php echo $objlang->get( 'text_sale' ); ?></span></span>
                <?php } ?>

                <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="imagezoom">
                    <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image"  data-zoom-image="<?php echo $popup; ?>" class="product-image-zoom img-responsive"/>
                </a>
            </div>
            <?php } ?>  
        </div>
        <div class="thumbnails thumbs-preview col-sm-2 horizontal">
            <?php if ($images) {        $icols = 4; $i= 0; ?>
             <div class="image-additional olw-carousel  owl-carousel-play" id="image-additional"   data-ride="owlcarousel">     
                 <div id="image-additional-carousel" class="owl-carousel" data-show="1" data-pagination="false" data-navigation="true">
                    <?php 
                    if( $productConfig['product_zoomgallery'] == 'slider' && $thumb ) {  
                        $eimages = array( 0=> array( 'popup'=>$popup,'thumb'=> $thumb )  ); 
                        $images = array_merge( $eimages, $images );
                    }
                    
                    $collection = array_chunk( $images, $icols );
                    foreach( $collection as $cimages ){ ?>
                        <div class="item clearfix">
                    <?php  
                        foreach ($cimages as  $image) { ?>
                            <div class="image-item">
                                <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="imagezoom" data-zoom-image="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>">
                                    <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $image['popup']; ?>" class="product-image-zoom img-responsive" />
                                </a>
                            </div>
                        <?php } ?>  
                        </div>        
                    <?php } ?>    
                </div>
                <!-- Controls -->
                <?php
                if(count($images)>$icols){
                ?>
                <!-- <div class="carousel-controls"> -->
                    <div class="carousel-controls carousel-controls-v4">
                        <a class="left carousel-control" href="#carousel-<?php echo $id; ?>" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right carousel-control" href="#carousel-<?php echo $id; ?>" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                        </a>
                    </div>  
                <!-- </div> -->
                <?php } ?>
            </div>          
           
            <?php } ?> 
        </div>  

    </div>      
</div>          
<?php } ?>

