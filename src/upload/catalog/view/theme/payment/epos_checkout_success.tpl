<?php
// Only for oc < 2.3 compatibility. Started from version 2.3. script was moved from 'payments' dir to 'extension/payments
?>
<?php use esas\epos\view\client\ViewStyle;
    echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) {
                    $class = 'col-sm-6';
                  } elseif ($column_left || $column_right) {
                    $class = 'col-sm-9';
                  } else {
                    $class = 'col-sm-12'; } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top;
                    $completionPanel->build(); ?>
            <div><?php echo $buttonContinue; ?></div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>