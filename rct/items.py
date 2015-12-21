# -*- coding: utf-8 -*-

import scrapy
from scrapy import Field

class rctItem(scrapy.Item):
	rct_id = Field()
	registration_date = Field()
	#couldn't log in to get: locations = Field()
	interventions = Field()
	clustering = Field()
	#couldn't log in to get: supporting_docs = Field()
	irb_name = Field()
	irb_date = Field()
	irb_number = Field()
	#couldn't log in to get: analysis_plan = Field()
	#couldn't log in to get: post_trial_stuff = Field()
	intervention_completion_date = Field()
	data_collection_complete = Field()
	final_ss_clusters = Field()
	attrition = Field()
	final_ss_observations = Field()
	final_ss_by_arms = Field()
	clustered_se = Field()
	public_data_url = Field()
	program_files = Field()
	program_files_url = Field()
	data_collection_completion_date = Field()
	#saw no examples: preliminary_reports = Field()
	relevant_papers_abstract = Field()
	relevant_papers_citation = Field()
	relevant_papers_url = Field()
	public_data = Field()
