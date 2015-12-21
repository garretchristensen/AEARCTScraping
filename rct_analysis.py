import json
from collections import Counter

scraped_fields = ['rct_id',
				'interventions',
				'clustering',
				'irb_name',
				'irb_date',
				'irb_number',
				'intervention_completion_date',
				'data_collection_complete',
				'final_ss_clusters',
				'attrition',
				'final_ss_observations',
				'final_ss_by_arms',
				'clustered_se',
				'public_data_url',
				'program_files',
				'program_files_url',
				'data_collection_completion_date',
				'relevant_papers_abstract',
				'relevant_papers_citation',
				'relevant_papers_url',
				'public_data']

json_file = open('items.json', 'r')
data_as_json = json.load(json_file)

print "There are", len(data_as_json), "RCTs in the database."


final_counts = Counter()

for rctItem in data_as_json:
	for field in scraped_fields:
		if field in rctItem:
			value = rctItem[field]
			if not value[0]: #Have to be careful not to count blank fields as existing
				continue
			final_counts[field] += 1

for field in scraped_fields:
	count = final_counts[field]
	warning = '****' if count==0 else ""
	print warning, count, "EXAMPLES OF", field, warning
